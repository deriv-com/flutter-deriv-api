import 'dart:async';
import 'dart:convert';

import 'package:json_schema/json_schema.dart';
import 'package:recase/recase.dart';

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';

Builder apiBuilder(final BuilderOptions _) => APIBuilder();

/// This class is responsible for parsing the morass of JSON schema
/// definition files for our API, and assembling them into request/response
/// objects suitable for marshalling and deserialising from our websockets
/// API.
class APIBuilder extends Builder {
  static const Map<String, String> typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'num',
    'object': 'Map<String, dynamic>',
    'array': 'List<String>',
  };
  static const Map<String, String> schemaTypeMap = <String, String>{
    'send': 'Request',
    'receive': 'Response',
  };

  @override
  Map<String, List<String>> get buildExtensions => const <String, List<String>>{
        '.json': <String>['.dart']
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    try {
      log.info('Reading ${buildStep.inputId} as JSON');
      final Map<dynamic, dynamic> schemaDefinition = jsonDecode(await buildStep.readAsString(buildStep.inputId));

      log.info('Processing schema definition from ${buildStep.inputId}');
      final JsonSchema schema = JsonSchema.createSchema(schemaDefinition);

      /* We keep our list of property keys in original form here so we can iterate over and map them */
      final List<String> props = schema.properties.keys.toList();

      /* Instead of trying anything too fancy here, we just provide a simple conversion from original
       JSON schema name - which is snake_cased - to something more Dart-suitable, and apply type
       mapping via "it's a string unless we have a better guess" heuristic. */
      props.sort();
      final String attrList = props.map((String k) {
        final String name = ReCase(k).camelCase;
        final JsonSchema prop = schema.properties[k];
        String type;
        // Currently we don't handle multiple types, could
        // treat those as `dynamic` but so far we don't have
        // enough of them to care too much
        if (prop.typeList?.isNotEmpty) {
          // The `.type` values are objects, not strings,
          // which leads to some confusing results when you
          // try to compare them as strings or use them as
          // map lookups... so we extract them out to separate
          // variables instead.
          final String schemaType = prop.type.toString();
          if(schemaType == 'array') {
            final String itemType = prop.items.type.toString();
            type = 'List<${typeMap[itemType]}>';
          } else {
            type = typeMap[schemaType] ?? 'String';
          }
        } else {
          log.warning('The property $k on ${buildStep.inputId} does not appear to have a type: defaulting to string');
          type = 'String';
        }
        return '''/// ${prop.description}
  ${type ?? "unknown"} ${name ?? "unknown"};
''';
      }).join('\n');

      /* Some minor chicanery here to find out which API method we're supposed to be processing */
      final matches = RegExp(r'^([^\|]+)\|.*/([^/]+)_(send|receive).json$').allMatches(buildStep.inputId.toString());
      final items = matches.elementAt(0);
      if (items.groupCount < 3) {
        log.info('Had fewer groups than expected from $items - this is likely not a send/receive request');
        return;
      }
      final libName = items.group(1);
      final methodName = items.group(2);
      final schemaType = items.group(3);
      final className = ReCase(methodName).pascalCase;

      log.info('Will write $className for $methodName as $schemaType under $libName');
      final fullClassName = className + schemaTypeMap[schemaType];
      final fileName = '${methodName}_${schemaType}';
      await buildStep.writeAsString(
          // Ideally we'd move somewhere else and reconstruct, but the builder is tediously
          // over-specific about where it lets you write things - you *can* navigate to parent
          // directories, but it's not easy to support dynamic names that way without a lot of
          // extra code.
          // https://stackoverflow.com/questions/51188114/dart-build-runner-can-only-scan-read-write-files-in-the-web-directory
          // AssetId(buildStep.inputId.package, 'lib/api/${className}${schemaTypeMap[schemaType]}.dart'),
          buildStep.inputId.changeExtension('.dart'),
          DartFormatter().format('''/// Autogenerated from ${buildStep.inputId}
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part '${fileName}.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ${fullClassName} {
  ${fullClassName}();
  factory ${fullClassName}.fromJson(Map<String, dynamic> json) => _\$${fullClassName}FromJson(json);
  Map<String, dynamic> toJson() => _\$${fullClassName}ToJson(this);

  // Properties
  ${attrList}

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
'''));
    } catch (e) {
      log.severe('Failed to process ${buildStep.inputId} - $e');
      return;
    }
  }
}
