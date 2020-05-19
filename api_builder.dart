import 'dart:async';
import 'dart:convert';
import 'package:build/build.dart';
import 'package:recase/recase.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_schema/json_schema.dart';

Builder apiBuilder(final BuilderOptions _) => APIBuilder();

final List<GeneratedResponseJson> generatedResponses =
    <GeneratedResponseJson>[];

/// This class is responsible for parsing the morass of JSON schema
/// definition files for our API, and assembling them into request/response
/// objects suitable for marshalling and deserialization from our WebSockets
/// API.
class APIBuilder extends Builder {
  static const Map<String, String> typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'num',
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
            /// generated automatically from ${buildStep.inputId}
            import 'package:json_annotation/json_annotation.dart';

            import '../${schemaType == 'send' ? 'request' : 'response'}.dart';

            part '$fileName.g.dart';

            /// JSON conversion for '$fileName'
            @JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
            class $classFullName extends ${schemaType == 'send' ? 'Request' : 'Response'} {
              /// Initialize $classFullName
              const $classFullName({
                  ${_getConstructorParameters(methodName, schema, schemaType, properties)},
                  ${_getSuperClassParameters(schemaType)},
                }): super(${_getSuperClassCallParameters(schemaType, methodName)},);
              
              /// Creates an instance from JSON
              factory $classFullName.fromJson(Map<String, dynamic> json) => _\$${classFullName}FromJson(json);
              
              // Properties
              ${_getProperties(buildStep, schema, properties)}

              /// Converts an instance to JSON
              @override
              Map<String, dynamic> toJson() => _\$${classFullName}ToJson(this);

              /// Creates a copy of instance with given parameters
              @override
              $classFullName copyWith(
                ${_getCopyWithMethod(buildStep, schema, schemaType, classFullName, properties)}
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
                (property.type?.toString() ?? 'string') == 'integer') {
              return 'this.${ReCase(key).camelCase} = 1';
            }
          }

          return 'this.${ReCase(key).camelCase}';
        },
      ).join(', ');

  String _getProperties(
    BuildStep buildStep,
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
          final String type = _getPropertyType(buildStep, property);

          return '''/// ${property.description.replaceAll('\n', '\n/// ')}
                    final ${type ?? "unknown"} ${name ?? "unknown"};
                  ''';
        },
      ).join('\n');

  String _getPropertyType(BuildStep buildStep, JsonSchema property) {
    if (property.typeList?.isNotEmpty ?? false) {
      if (property.oneOf.isNotEmpty) {
        return 'dynamic';
      } else {
        final String schemaType = _getSchemaType(property);

        if (schemaType == 'array') {
          // Some types aren't specified - forget_all for example
          final String itemType = property.items?.type?.toString() ?? 'undefined';

          return 'List<${typeMap[itemType]}>';
        } else {
          return typeMap[schemaType];
        }
      }
    } else {
      return 'String';
    }
  }

  String _getSchemaType(JsonSchema property) => property.typeList?.length == 2
      ? property.typeList.first.toString() != 'null'
          ? property.typeList.first.toString() ?? 'dynamic'
          : property.typeList.last.toString() ?? 'dynamic'
      : property.type?.toString() ?? 'dynamic';

  String _getCopyWithMethod(
    BuildStep buildStep,
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

            final String type = _getPropertyType(buildStep, property);

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
