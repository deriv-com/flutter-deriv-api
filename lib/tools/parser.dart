import 'dart:convert';
import 'dart:io';
import 'package:flutter_deriv_api/tools/json_schema_parser.dart';
import 'package:recase/recase.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    throw Exception('Invalid arguments.');
  }

  final String methodsString =
      File('${arguments.first.split('.').first}_methods.txt')
          .readAsStringSync();

  final String className =
      '${ReCase((arguments.first.split('/').last.split('_')..removeLast()).join("_")).pascalCase}Response';

  final List<StringBuffer> source = JsonSchemaParser().getClasses(
      JsonSchemaParser.getClassTypesFor(JsonSchemaParser.preProcessModels(
        json.decode(
          File(arguments.first).readAsStringSync(),
        ),
      )),
      className: className,
      methodsString: methodsString,
      isRoot: true);

  final List<StringBuffer> result = _addImports(source);
  final File output = File('${arguments.first.split('.').first}_result.dart');

  for (final StringBuffer item in result) {
    output.writeAsStringSync('${item.toString()}', mode: FileMode.append);
  }
}

List<StringBuffer> _addImports(List<StringBuffer> source) {
  final StringBuffer baseImports =
      StringBuffer("import 'package:meta/meta.dart';\n");
  final StringBuffer helperImport =
      StringBuffer("import 'package:flutter_deriv_api/utils/helpers.dart';\n");
  if (source.any((StringBuffer buffer) =>
      buffer.toString().contains('getBool') ||
      buffer.toString().contains('getDouble'))) {
    return <StringBuffer>[baseImports, helperImport, ...source];
  }
  return <StringBuffer>[baseImports, ...source];
}
