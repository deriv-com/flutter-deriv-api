import 'dart:convert' as conv;
import 'dart:io';
import 'package:flutter_deriv_api/tools/json_schema_parser.dart';
import 'package:flutter_deriv_api/tools/schema_model.dart';
import 'package:recase/recase.dart';
import 'package:meta/meta.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    throw Exception('Invalid arguments.');
  }

  // final String methodsString =
  //     File('${arguments.first.split('.').first}_methods.txt')
  //         .readAsStringSync();

  final String fileBaseName =
      (arguments.first.split('/').last.split('_')..removeLast()).join('_');

  final String className = '${ReCase(fileBaseName).pascalCase}Response';

  final List<SchemaModel> rootChildern =
      JsonSchemaParser.getClassTypesFor(JsonSchemaParser.preProcessModels(
    conv.json.decode(
      File(arguments.first).readAsStringSync(),
    ),
  ));

  final SchemaModel rootModel = SchemaModel()
    ..className = className
    ..children = rootChildern;

  for (final SchemaModel model in rootChildern) {
    model.parrent = rootModel;
  }

  final List<StringBuffer> source =
      JsonSchemaParser().getClasses(rootModel, methodsString: "", isRoot: true);

  final List<StringBuffer> result =
      _addImports(source: source, baseName: fileBaseName);
  final File output = File('${arguments.first.split('.').first}_result.dart');

  //Temp

  final File jsonConfig =
      File('${arguments.first.split('.').first}_methods.json')
        ..writeAsStringSync('{\n    "methods" : "",\n    "imports" : ""\n}',
            mode: FileMode.append);

  for (final StringBuffer item in result) {
    output.writeAsStringSync('${item.toString()}', mode: FileMode.append);
  }
}

List<StringBuffer> _addImports(
    {@required List<StringBuffer> source, @required String baseName}) {
  final StringBuffer baseImports = StringBuffer("""
import 'package:meta/meta.dart';
import 'package:flutter_deriv_api/basic_api/generated/${baseName}_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/${baseName}_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
      """);
  final StringBuffer helperImport =
      StringBuffer("import 'package:flutter_deriv_api/utils/helpers.dart';\n");
  if (source.any((StringBuffer buffer) =>
      buffer.toString().contains('getBool') ||
      buffer.toString().contains('getDateTime') ||
      buffer.toString().contains('getDouble'))) {
    return <StringBuffer>[baseImports, helperImport, ...source];
  }
  return <StringBuffer>[baseImports, ...source];
}
