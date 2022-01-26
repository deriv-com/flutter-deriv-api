import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_schema2/json_schema2.dart';
import 'package:recase/recase.dart';

Builder apiBuilder(final BuilderOptions _) => APIBuilder();

final List<GeneratedResponseJson> generatedResponses =
    <GeneratedResponseJson>[];

/// A Code generator class responsible for parsing the morass of JSON schema
/// definition files for our API, and assembling them into request/response
/// objects suitable for marshalling and deserialization from our WebSockets API.
class APIBuilder extends Builder {
  static const Map<String, String> typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'num',
    'bool': 'bool',
    'object': 'Map<String, dynamic>',
    'array': 'List<String>',
    'undefined': 'dynamic',
    'integer?': 'int?',
    'string?': 'String?',
    'number?': 'num?',
    'bool?': 'bool?',
    'object?': 'Map<String, dynamic>?',
    'array?': 'List<String>?',
    'undefined?': 'dynamic',
  };

  static const Map<String, String> schemaTypeMap = <String, String>{
    'send': 'Request',
    'receive': 'Receive',
  };

  static const Map<String, String> requestCommonFields = <String, String>{
    'passthrough': 'object?',
    'req_id': 'integer?',
  };

  static const Map<String, String> responseCommonFields = <String, String>{
    'echo_req': 'object?',
    'error': 'object?',
    'msg_type': 'string?',
    'req_id': 'integer?',
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

      // We keep our list of property keys in original form here so we can iterate over and map them.
      final List<String> properties = schema.properties.keys.toList()..sort();

      // Some minor chicanery here to find out which API method we're supposed to be processing.
      final Iterable<RegExpMatch> matches =
          RegExp(r'^([^\|]+)\|.*/([^/]+)_(send|receive).json$')
              .allMatches(buildStep.inputId.toString());

      final RegExpMatch items = matches.elementAt(0);

      if (items.groupCount < 3) {
        return;
      }

      final String methodName = items.group(2)!;
      final String schemaType = items.group(3)!;
      final String className = ReCase(methodName).pascalCase;

      final String classFullName = className + schemaTypeMap[schemaType]!;
      final String fileName = '${methodName}_$schemaType';

      if (schemaType == 'receive') {
        final Map<String, dynamic> propertiesMap =
            schemaDefinition['properties'];

        if (propertiesMap.containsKey('msg_type')) {
          final Map<String, dynamic> messageType = propertiesMap['msg_type'];

          if (messageType.containsKey('enum')) {
            generatedResponses.add(
              GeneratedResponseJson(
                msgType: messageType['enum'].first,
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
            /// Generated automatically from ${buildStep.inputId}.

            // ignore_for_file: always_put_required_named_parameters_first

            import '../${schemaType == 'send' ? 'request' : 'response'}.dart';
            /// ${ReCase(classFullName).sentenceCase} class.
            class $classFullName extends ${schemaType == 'send' ? 'Request' : 'Response'} {
              /// Initialize $classFullName.
              const $classFullName({
                  ${_getConstructorParameters(methodName, schema, schemaType, properties)}
                  ${_getSuperClassParameters(schemaType)},
                }): super(${_getSuperClassCallParameters(schemaType, methodName)},);
              
              ${_getFromJsonMethod(classFullName, schema, schemaType, properties)}
              
              ${_getProperties(schema, properties)}
              ${_getToJsonMethod(schema, schemaType, properties)}
              ${_getCopyWithMethod(schema, schemaType, classFullName, properties)}
              
              /// Override equatable class.
              @override
              List<Object?> get props => ${_getEquatableFields(classFullName, properties)};
            }
          ''',
        ),
      );
    } on Exception catch (e) {
      log.severe('Failed to process ${buildStep.inputId} - $e');
    }
  }

  static String _getConstructorParameters(
    String methodName,
    JsonSchema schema,
    String schemaType,
    List<String> properties,
  ) {
    final Iterable<String> fields = properties.where((String key) =>
        !(requestCommonFields.containsKey(key) ||
            responseCommonFields.containsKey(key)));

    final String result = fields.map(
      (String key) {
        final JsonSchema property = schema.properties[key]!;

        if (property.typeList?.isNotEmpty ?? false) {
          final bool isBool = _getPropertyRawType(key, property) == 'bool';

          // Set method default value to `true`
          if (schemaType == 'send' && key == methodName && isBool) {
            return 'this.${ReCase(key).camelCase} = true';
          }
        }

        return '${_isFieldRequired(key, schemaType, property) ? 'required ' : ''} this.${ReCase(key).camelCase}';
      },
    ).join(', ');
    return fields.isEmpty ? result : '$result , ';
  }

  static String _getProperties(
    JsonSchema schema,
    List<String> properties,
  ) =>
      properties
          .where((String key) => !(requestCommonFields.containsKey(key) ||
              responseCommonFields.containsKey(key)))
          .map(
        (String key) {
          final String name = ReCase(key).camelCase;
          final JsonSchema property = schema.properties[key]!;
          final String rawType = _getPropertyRawType(key, property);

          return '''
            /// ${_preparePropertyDescription(rawType == 'bool', property.description)}
            final ${_getPropertyType(rawType)} $name;
          ''';
        },
      ).join('\n');

  static String _preparePropertyDescription(
    bool isBoolean,
    String? description,
  ) =>
      description == null
          ? ''
          : isBoolean
              ? description
                  .replaceAll('\n', '\n/// ')
                  .replaceAllMapped(
                    RegExp(r'`1`| 1| 1 '),
                    (Match match) => match
                        .group(0)!
                        .replaceAllMapped(RegExp(r'`1`|1'), (_) => '`true`'),
                  )
                  .replaceAllMapped(
                    RegExp(r'`0`| 0| 0 '),
                    (Match match) => match
                        .group(0)!
                        .replaceAllMapped(RegExp(r'`0`|0'), (_) => '`false`'),
                  )
              : description.replaceAll('\n', '\n/// ');

  static String _getPropertyRawType(String key, JsonSchema property) {
    if (property.oneOf.isNotEmpty || property.anyOf.isNotEmpty) {
      return 'dynamic';
    } else {
      final String? propertySchemaType = _getPropertySchemaType(key, property);

      if (propertySchemaType == 'array') {
        // Some types aren't specified - forget_all for example
        final String itemType = property.items?.type?.toString() ?? 'undefined';

        return 'List<${typeMap[itemType]}>';
      } else {
        return typeMap[propertySchemaType] ?? 'dynamic';
      }
    }
  }

  static String _getPropertyType(String type) =>
      '$type${type == 'dynamic' ? '' : '?'}';

  static String? _getPropertySchemaType(String key, JsonSchema property) =>
      property.typeList?.length == 2
          ? property.typeList!.first.toString() != 'null'
              ? property.typeList!.first.toString()
              : property.typeList!.last.toString()
          : property.type?.toString() == null
              ? 'undefined'
              : _isBoolean(key, property)
                  ? 'bool'
                  : property.type?.toString();

  static bool _isBoolean(String key, JsonSchema property) {
    final List<dynamic> enumValues = property.enumValues ?? <dynamic>[];

    return key == 'subscribe' ||
        property.description!.contains('Must be `1`') ||
        property.description!.contains('Must be 1') ||
        property.type?.toString() == 'integer' &&
            enumValues.length == 2 &&
            enumValues.contains(0) &&
            enumValues.contains(1);
  }

  static StringBuffer _getFromJsonMethod(
    String classFullName,
    JsonSchema schema,
    String schemaType,
    List<String> properties,
  ) =>
      StringBuffer(
        '''
          /// Creates an instance from JSON.
          factory $classFullName.fromJson(Map<String, dynamic> json) => $classFullName(
        ''',
      )
        ..write(
          properties
              .where((String key) => !(requestCommonFields.containsKey(key) ||
                  responseCommonFields.containsKey(key)))
              .map((String key) {
            final String name = ReCase(key).camelCase;
            final JsonSchema property = schema.properties[key]!;
            final String rawType = _getPropertyRawType(key, property);
            final String type = _getPropertyType(rawType);

            if (rawType == 'bool') {
              return '$name: json[\'$key\'] == null ? null : json[\'$key\'] == 1,';
            } else if (rawType.contains('List')) {
              final String arrayType = _getArrayType(rawType);

              return arrayType == 'dynamic'
                  ? '$name: json[\'$key\'] as $type,'
                  : '''
                      $name: (json['$key'] as List<dynamic>?)
                        ?.map<$arrayType>((dynamic item) => item as $arrayType)
                        .toList(),
                    ''';
            } else {
              return '$name: json[\'$key\'] as $type,';
            }
          }).join(),
        )
        ..write('${_getFromJsonMethodCommonFields(schemaType == 'send')});');

  static StringBuffer _getToJsonMethod(
    JsonSchema schema,
    String schemaType,
    List<String> properties,
  ) =>
      StringBuffer(
        '''
          /// Converts this instance to JSON
          @override
          Map<String, dynamic> toJson() => <String, dynamic>{
        ''',
      )
        ..write(
          properties
              .where((String key) => !(requestCommonFields.containsKey(key) ||
                  responseCommonFields.containsKey(key)))
              .map((String key) {
            final String name = ReCase(key).camelCase;
            final JsonSchema property = schema.properties[key]!;
            final String rawType = _getPropertyRawType(key, property);

            return '\'$key\': $name${rawType == 'bool' ? ' == null ? null : $name! ? 1 : 0' : ''},';
          }).join(),
        )
        ..write('${_getToJsonMethodCommonFields(schemaType == 'send')}};');

  static StringBuffer _getFromJsonMethodCommonFields(bool isRequest) =>
      StringBuffer()
        ..write(
          (isRequest
                  ? requestCommonFields.entries
                  : responseCommonFields.entries)
              .map<String>((MapEntry<String, String> entry) =>
                  '${ReCase(entry.key).camelCase}: json[\'${entry.key}\'] as ${typeMap[entry.value]},')
              .join(),
        );

  static StringBuffer _getToJsonMethodCommonFields(bool isRequest) =>
      StringBuffer()
        ..write(
          (isRequest ? requestCommonFields.keys : responseCommonFields.keys)
              .map((String key) => '\'$key\': ${ReCase(key).camelCase},')
              .join(),
        );

  static String _getArrayType(String type) =>
      type.substring(0, type.length - 1).replaceAll('List<', '');

  static StringBuffer _getCopyWithMethod(
    JsonSchema schema,
    String schemaType,
    String classFullName,
    List<String> properties,
  ) {
    final Iterable<String> fields = properties.where((String key) =>
        !(requestCommonFields.containsKey(key) ||
            responseCommonFields.containsKey(key)));
    return StringBuffer(
      '''
          /// Creates a copy of instance with given parameters
            @override
            $classFullName copyWith({
        ''',
    )
      ..write(
        fields.map(
          (String key) {
            final String name = ReCase(key).camelCase;
            final JsonSchema property = schema.properties[key]!;
            final String rawType = _getPropertyRawType(key, property);

            return '${_getPropertyType(rawType)} $name';
          },
        ).join(', '),
      )
      ..write(fields.isEmpty ? '' : ', ')
      ..write('${_getSuperClassParameters(schemaType)},}) => $classFullName (')
      ..write(
        fields.map(
          (String key) {
            final String name = ReCase(key).camelCase;
            return '$name: $name ?? this.$name';
          },
        ).join(', '),
      )
      ..write(fields.isEmpty ? '' : ', ')
      ..write('${_getSupperClassAssignments(schemaType)},);');
  }

  static String _getSuperClassParameters(String? schemaType) {
    final Map<String, String> superClassFields =
        _getSuperClassFields(schemaType);

    return superClassFields.keys
        .map((String key) =>
            '${typeMap[superClassFields[key]!]} ${ReCase(key).camelCase}')
        .join(', ');
  }

  static String _getSuperClassCallParameters(
    String schemaType,
    String methodName,
  ) {
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

  static String _getSupperClassAssignments(String schemaType) =>
      _getSuperClassFields(schemaType).keys.map(
        (String key) {
          final String propertyName = ReCase(key).camelCase;
          return '$propertyName: $propertyName ?? this.$propertyName';
        },
      ).join(', ');

  static Map<String, String> _getSuperClassFields(String? schemaType) =>
      schemaType == 'send' ? requestCommonFields : responseCommonFields;

  static bool _isFieldRequired(
    String key,
    String schemaType,
    JsonSchema property,
  ) =>
      schemaType == 'send' &&
      key != 'subscribe' &&
      property.typeList?.length == 1 &&
      !property.description!.contains('[Optional]');

  static String _getEquatableFields(
    String classFullName,
    List<String> properties,
  ) {
    switch (classFullName) {
      case 'TicksRequest':
        return '<Object?>[ticks]';
      case 'ProposalOpenContractRequest':
        return '<Object?>[contractId]';
      case 'P2pOrderInfoRequest':
      case 'P2pAdvertiserInfoRequest':
        return '<Object?>[id]';

      default:
        return '<Object?>[]';
    }
  }
}

class GeneratedResponseJson extends Comparable<GeneratedResponseJson> {
  GeneratedResponseJson({
    this.msgType,
    this.fileName,
    this.fullClassName,
    this.isManual = false,
  });

  final String? msgType;
  final String? fileName;
  final String? fullClassName;
  final bool isManual;

  @override
  int compareTo(GeneratedResponseJson other) =>
      fileName!.compareTo(other.fileName!);
}
