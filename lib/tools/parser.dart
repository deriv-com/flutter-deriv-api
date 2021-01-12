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

  final Map<String, dynamic> methodsjson = conv.json.decode(
      File('${arguments.first.split('.').first}_methods.json')
          .readAsStringSync());
//methodsjson['methods']
  final List<StringBuffer> source = JsonSchemaParser().getClasses(rootModel,
      methodsString: methodsjson['methods'], isRoot: true);

  final List<StringBuffer> result =
      _addImports(source: source, imports: methodsjson['imports']);
  final File output = File('lib/api/response/${fileBaseName}_receive_result.dart');

  //Temp

  // final File jsonConfig =
  //     File('${arguments.first.split('.').first}_methods.json')
  //       ..writeAsStringSync('{\n    "methods" : "",\n    "imports" : ""\n}',
  //           mode: FileMode.append);

  for (final StringBuffer item in result) {
    output.writeAsStringSync('${item.toString()}', mode: FileMode.append);
  }
}

List<StringBuffer> _addImports(
    {@required List<StringBuffer> source, @required String imports}) {
  final StringBuffer baseImports = StringBuffer(imports)..write('\n\n');

  return <StringBuffer>[baseImports, ...source];
}
