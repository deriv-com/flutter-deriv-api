import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';

import 'package:recase/recase.dart';

import 'package:flutter_deriv_api/tools/schema_parser/json_schema_parser.dart';
import 'package:flutter_deriv_api/tools/schema_parser/schema_model.dart';

Builder apiParser(final BuilderOptions _) => APIParser();

/// APIParser Class which handles generating API response classes.
class APIParser extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) {
    try {
      final String path = buildStep.inputId.path;
      Map<String, dynamic>? methodsJSON;

      final String fileBaseName =
          (path.split('/').last.split('_')..removeLast()).join('_');
      final String className = '${ReCase(fileBaseName).pascalCase}Response';

      final List<SchemaModel> rootChildren =
          JsonSchemaParser.getClassTypesFor(JsonSchemaParser.preProcessModels(
        json.decode(
          File(path).readAsStringSync(),
        ),
      ));

      final String leftPartPath =
          (path.split('.').first.split('/')..removeLast()).join('/');
      final String rightPartPath = path.split('.').first.split('/').last;

      final File methodsFile =
          File('$leftPartPath/methods/${rightPartPath}_methods.json');
      if (methodsFile.existsSync()) {
        methodsJSON = json.decode(methodsFile.readAsStringSync());
      }

      final List<StringBuffer> source = JsonSchemaParser().getClasses(
        SchemaModel.newModelWithChildren(
            children: rootChildren, className: className),
        methodsString: methodsJSON?['methods'] ?? '',
        isRoot: true,
      );

      final List<StringBuffer> result = _addImports(
        source: source,
        imports: methodsJSON?['imports'] ??
            "// TODO(unknown): Create methods file in lib/basic_api/generated/methods for this file.\n import '../../helpers/helpers.dart';",
      );

      final File output =
          File('lib/api/response/${fileBaseName}_receive_result.dart');

      if (!output.existsSync()) {
        output.createSync(recursive: true);
      } else {
        output.writeAsStringSync('');
      }

      for (final StringBuffer item in result) {
        output.writeAsStringSync('${item.toString()}', mode: FileMode.append);
      }

      JsonSchemaParser.classNamesArray.clear();
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
    {required List<StringBuffer> source, required String imports}) {
  final StringBuffer baseImports = StringBuffer(imports)..write('\n\n');

  return <StringBuffer>[baseImports, ...source];
}
