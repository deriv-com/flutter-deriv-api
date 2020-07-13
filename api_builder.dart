import 'dart:async';
import 'dart:convert';
import 'package:build/build.dart';
import 'package:recase/recase.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_schema/json_schema.dart';

Builder apiBuilder(final BuilderOptions _) => APIBuilder();

final List<GeneratedResponseJson> generatedResponses =
    <GeneratedResponseJson>[];

/// A Code generator class responsible for parsing the morass of JSON schema
/// definition files for our API, and assembling them into request/response
/// objects suitable for marshalling and deserialization from our WebSockets
/// API.
class APIBuilder extends Builder {
  static const Map<String, String> typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'num',
    'bool': 'bool',
    'object': 'Map<String, dynamic>',
    'array': 'List<String>',
    'undefined': 'dynamic',
  };

  static const Map<String, String> schemaTypeMap = <String, String>{
    'send': 'Request',
    'receive': 'Response',
  };

  static const Map<String, String> requestCommonFields = <String, String>{
    'passthrough': 'object',
    'req_id': 'integer',
  };

  static const Map<String, String> responseCommonFields = <String, String>{
    'echo_req': 'object',
    'error': 'object',
    'msg_type': 'string',
    'req_id': 'integer',
  };

  @override
  Map<String, List<String>> get buildExtensions => const <String, List<String>>{
        '.json': <String>['.dart']
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    try {
      final Map<dynamic, dynamic> schemaDefinition =
          jsonDecode(await buildStep.readAsString(buildStep.inputId));

      final JsonSchema schema = JsonSchema.createSchema(schemaDefinition);

      // We keep our list of property keys in original form here so we can iterate over and map them
      final List<String> properties = schema.properties.keys.toList()..sort();

      // Some minor chicanery here to find out which API method we're supposed to be processing
      final Iterable<RegExpMatch> matches =
          RegExp(r'^([^\|]+)\|.*/([^/]+)_(send|receive).json$')
              .allMatches(buildStep.inputId.toString());

      final RegExpMatch items = matches.elementAt(0);

      if (items.groupCount < 3) {
        return;
      }

      final String methodName = items.group(2);
      final String schemaType = items.group(3);
      final String className = ReCase(methodName).pascalCase;

      final String classFullName = className + schemaTypeMap[schemaType];
      final String fileName = '${methodName}_$schemaType';

      if (schemaType == 'receive') {
        final Map<String, dynamic> propertiesMap =
            schemaDefinition['properties'];

        if (propertiesMap.containsKey('msg_type')) {
          final Map<String, dynamic> messageType = propertiesMap['msg_type'];

          if (messageType.containsKey('enum')) {
            generatedResponses.add(
              GeneratedResponseJson(
                msgType: messageType['enum'][0],
                fileName: fileName,
                fullClassName: classFullName,
              ),
            );
          }
        }
      }

      await buildStep.writeAsString(
        // Ideally we'd move somewhere else and reconstruct, but the builder is tediously
        // over-specific about where it lets you write things - you *can* navigate to parent
        // directories, but it's not easy to support dynamic names that way without a lot of
        // extra code.
        // https://stackoverflow.com/questions/51188114/dart-build-runner-can-only-scan-read-write-files-in-the-web-directory
        // AssetId(buildStep.inputId.package, 'lib/api/${className}${schemaTypeMap[schemaType]}.dart'),
        buildStep.inputId.changeExtension('.dart'),
        DartFormatter().format(
          '''
            /// Generated automatically from ${buildStep.inputId}
            // ignore_for_file: avoid_as, always_specify_types

            ${_hasRequiredField(methodName, schema, schemaType, properties) ? 'import \'package:meta/meta.dart\';' : ''}

            import '../${schemaType == 'send' ? 'request' : 'response'}.dart';

            /// ${ReCase(classFullName).sentenceCase} class
            class $classFullName extends ${schemaType == 'send' ? 'Request' : 'Response'} {
              /// Initialize $classFullName
              const $classFullName({
                  ${_getConstructorParameters(methodName, schema, schemaType, properties)},
                  ${_getSuperClassParameters(schemaType)},
                }): super(${_getSuperClassCallParameters(schemaType, methodName)},);
              
              ${_generateFromJson(classFullName, schema, properties)}
              
              ${_getProperties(schema, properties)}

              ${_generateToJson(schema, properties)}

              /// Creates a copy of instance with given parameters
              @override
              $classFullName copyWith(
                ${_getCopyWithMethod(schema, schemaType, classFullName, properties)}
              );

              /// Override equatable class
              @override
              List<Object> get props => ${_getEquatableFields(classFullName, properties)};
            }
          ''',
        ),
      );
    } on Exception catch (e) {
      log.severe('Failed to process ${buildStep.inputId} - $e');
    }
  }

  String _getConstructorParameters(
    String methodName,
    JsonSchema schema,
    String schemaType,
    List<String> properties,
  ) =>
      properties
          .where((String key) => !(requestCommonFields.containsKey(key) ||
              responseCommonFields.containsKey(key)))
          .map(
        (String key) {
          final JsonSchema property = schema.properties[key];

          if (property.typeList?.isNotEmpty ?? false) {
            // Set method default value to 1
            if (schemaType == 'send' &&
                key == methodName &&
                _getPropertyType(key, property) == 'bool') {
              return 'this.${ReCase(key).camelCase} = true';
            }
          }

          return '${_isFieldRequired(key, schemaType, property) ? '@required ' : ''} this.${ReCase(key).camelCase}';
        },
      ).join(', ');

  String _getProperties(
    JsonSchema schema,
    List<String> properties,
  ) =>
      properties
          .where((String key) => !(requestCommonFields.containsKey(key) ||
              responseCommonFields.containsKey(key)))
          .map(
        (String key) {
          final String name = ReCase(key).camelCase;
          final JsonSchema property = schema.properties[key];
          final String type = _getPropertyType(key, property);
          final String description = property.description
              .replaceAll('\n', '\n/// ')
              .replaceAll('`1` to stream', '`true` to stream')
              .replaceAll('Must be `1`', 'Must be `true`')
              .replaceAll('Must be 1', 'Must be `true`');

          return '''
            /// $description
            final ${type ?? "unknown"} ${name ?? "unknown"};
          ''';
        },
      ).join('\n');

  String _getPropertyType(
    String key,
    JsonSchema property,
  ) {
    if (property.oneOf.isNotEmpty) {
      return 'dynamic';
    } else {
      final String propertySchemaType = _getPropertySchemaType(key, property);

      if (propertySchemaType == 'array') {
        // Some types aren't specified - forget_all for example
        final String itemType = property.items?.type?.toString() ?? 'undefined';

        return 'List<${typeMap[itemType]}>';
      } else {
        return typeMap[propertySchemaType];
      }
    }
  }

  String _getPropertySchemaType(String key, JsonSchema property) =>
      property.typeList?.length == 2
          ? property.typeList.first.toString() != 'null'
              ? property.typeList.first.toString() ?? 'undefined'
              : property.typeList.last.toString() ?? 'undefined'
          : property.type?.toString() == null
              ? 'undefined'
              : _isBoolean(key, property) ? 'bool' : property.type?.toString();

  bool _isBoolean(String key, JsonSchema property) =>
      key == 'subscribe' ||
      property.description.contains('Must be `1`') ||
      property.description.contains('Must be 1') ||
      property.type?.toString() == 'integer' &&
          property?.enumValues?.length == 2 &&
          property?.enumValues[0] == 0 &&
          property?.enumValues[1] == 1;

  String _getCopyWithMethod(
    JsonSchema schema,
    String schemaType,
    String classFullName,
    List<String> properties,
  ) {
    final StringBuffer result = StringBuffer('{')
      ..write(
        properties
            .where((String key) => !(requestCommonFields.containsKey(key) ||
                responseCommonFields.containsKey(key)))
            .map(
          (String key) {
            final String name = ReCase(key).camelCase;
            final JsonSchema property = schema.properties[key];
            final String type = _getPropertyType(key, property);

            return '$type $name';
          },
        ).join(', '),
      )
      ..write(
          ', ${_getSuperClassParameters(schemaType)}, }) => $classFullName (')
      ..write(
        properties
            .where((String key) => !(requestCommonFields.containsKey(key) ||
                responseCommonFields.containsKey(key)))
            .map(
          (String key) {
            final String name = ReCase(key).camelCase;
            return '$name: $name ?? this.$name';
          },
        ).join(', '),
      )
      ..write(', ${_getSupperClassAssignments(schemaType)},');

    return result.toString();
  }

  String _getSuperClassParameters(String schemaType) {
    final Map<String, String> superClassFields =
        _getSuperClassFields(schemaType);

    return superClassFields.keys
        .map((String key) =>
            '${typeMap[superClassFields[key]]} ${ReCase(key).camelCase}')
        .join(', ');
  }

  String _getSuperClassCallParameters(String schemaType, String methodName) {
    final StringBuffer superCallParameters = StringBuffer();

    if (schemaType == 'send') {
      superCallParameters.write('msgType: \'$methodName\',');
    }

    superCallParameters.write(_getSuperClassFields(schemaType).keys.map(
      (String key) {
        final String parameterName = ReCase(key).camelCase;
        return '$parameterName: $parameterName';
      },
    ).join(', '));

    return superCallParameters.toString();
  }

  String _getSupperClassAssignments(String schemaType) =>
      _getSuperClassFields(schemaType).keys.map(
        (String key) {
          final String propertyName = ReCase(key).camelCase;
          return '$propertyName: $propertyName ?? this.$propertyName';
        },
      ).join(', ');

  Map<String, String> _getSuperClassFields(String schemaType) =>
      schemaType == 'send' ? requestCommonFields : responseCommonFields;

  bool _isFieldRequired(
    String key,
    String schemaType,
    JsonSchema property,
  ) =>
      schemaType == 'send' &&
      key != 'subscribe' &&
      property.typeList?.length == 1 &&
      !property.description.contains('[Optional]');

  bool _hasRequiredField(
    String methodName,
    JsonSchema schema,
    String schemaType,
    List<String> properties,
  ) {
    if (schemaType == 'send') {
      for (String key in properties) {
        final JsonSchema property = schema.properties[key];

        if (property.typeList?.isNotEmpty ?? false) {
          if (key == methodName && _getPropertyType(key, property) == 'bool') {
            continue;
          }
        }

        if (_isFieldRequired(key, schemaType, property)) {
          return true;
        }
      }
    }

    return false;
  }

  String _getEquatableFields(String classFullName, List<String> properties) {
    switch (classFullName) {
      case 'TicksRequest':
        return '<Object>[ticks]';
      case 'ProposalOpenContractRequest':
        return '<Object>[contractId]';
      case 'P2pOrderInfoRequest':
      case 'P2pAdvertiserInfoRequest':
        return '<Object>[id]';

      default:
        return 'null';
    }
  }

  String _generateFromJson(
    String classFullName,
    JsonSchema schema,
    List<String> properties,
  ) {
    final StringBuffer result = StringBuffer(
      '''
        /// Creates an instance from JSON
        factory $classFullName.fromJson(Map<String, dynamic> json) => $classFullName(
      ''',
    )
      ..write(
        properties.map((String key) {
          final String name = ReCase(key).camelCase;
          final JsonSchema property = schema.properties[key];
          final String type = _getPropertyType(key, property);

          if (type == 'bool') {
            return '''
                $name: json['$key'] == null ? null : json['$key'] == 1,
              ''';
          } else if (type.contains('List')) {
            final String arrayType =
                type.substring(0, type.length - 1).replaceAll('List<', '');

            return '''
                $name: (json['$key'] as List)
                  ?.map(($dynamic item) => item as $arrayType)
                  ?.toList(),
              ''';
          } else {
            return '''
                $name: json['$key'] as $type,
              ''';
          }
        }).join(),
      )
      ..write(');');

    return result.toString();
  }

  String _generateToJson(
    JsonSchema schema,
    List<String> properties,
  ) {
    final StringBuffer result = StringBuffer(
      '''
        /// Converts an instance to JSON
        @override
        Map<String, dynamic> toJson() => <String, dynamic>{
      ''',
    )
      ..write(
        properties.map((String key) {
          final String name = ReCase(key).camelCase;
          final JsonSchema property = schema.properties[key];
          final String type = _getPropertyType(key, property);

          return '''
            '$key': $name${type == 'bool' ? ' == null ? null : $name ? 1 : 0' : ''},
          ''';
        }).join(),
      )
      ..write('};');

    return result.toString();
  }
}

class GeneratedResponseJson extends Comparable<GeneratedResponseJson> {
  GeneratedResponseJson({
    this.msgType,
    this.fileName,
    this.fullClassName,
  });

  final String msgType;
  final String fileName;
  final String fullClassName;

  @override
  int compareTo(GeneratedResponseJson other) =>
      fileName.compareTo(other.fileName);
}
