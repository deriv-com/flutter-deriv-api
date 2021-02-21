import 'dart:async';
import 'dart:convert' as conv;
import 'dart:io';

import 'package:build/build.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

import 'lib/tools/json_schema_parser.dart';
import 'lib/tools/schema_model.dart';

Builder apiParser(final BuilderOptions _) => APIParser();

/// APIParser Class handles generating resn
class APIParser extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) {
    try {
      final String path = buildStep.inputId.path;
      final String fileBaseName =
          (path.split('/').last.split('_')..removeLast()).join('_');
      final String className = '${ReCase(fileBaseName).pascalCase}Response';

      final List<SchemaModel> rootChildern =
          JsonSchemaParser.getClassTypesFor(JsonSchemaParser.preProcessModels(
        conv.json.decode(
          File(path).readAsStringSync(),
        ),
      ));

      final String leftPartPath =
          (path.split('.').first.split('/')..removeLast()).join('/');
      final String rightPartPath = path.split('.').first.split('/').last;
      final Map<String, dynamic> methodsjson = conv.json.decode(
          File('$leftPartPath/methods/${rightPartPath}_methods.json')
              .readAsStringSync());

      final List<StringBuffer> source = JsonSchemaParser().getClasses(
          SchemaModel.newModelWithChildren(
              children: rootChildern, className: className),
          methodsString: methodsjson['methods'],
          isRoot: true);

      final List<StringBuffer> result =
          _addImports(source: source, imports: methodsjson['imports']);

      final File output =
          File('lib/api/response/${fileBaseName}_receive_result.dart');
      if (!output.existsSync()) {
        output.createSync(recursive: true);
        for (final StringBuffer item in result) {
          output.writeAsStringSync('${item.toString()}', mode: FileMode.append);
        }
      }
    } on Exception catch (e, stack) {
      log
        ..severe('Failed to process ${buildStep.inputId} - $e')
        ..severe('Stack trace $stack');
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => const <String, List<String>>{
        '.json': <String>['_result.dart']
      };
}

List<StringBuffer> _addImports(
    {@required List<StringBuffer> source, @required String imports}) {
  final StringBuffer baseImports = StringBuffer(imports)..write('\n\n');

  return <StringBuffer>[baseImports, ...source];
}
