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

      final List<SchemaModel> rootChildren = JsonSchemaParser.getClassTypesFor(
        JsonSchemaParser.preProcessModels(
          json.decode(File(path).readAsStringSync()),
        ),
      );
print('getClassTypesFor done');
      final String leftPartPath =
          (path.split('.').first.split('/')..removeLast()).join('/');
      final String rightPartPath = path.split('.').first.split('/').last;

      final File methodsFile =
          File('$leftPartPath/methods/${rightPartPath}_methods.json');

      if (!methodsFile.existsSync()) {
        methodsFile
          ..createSync()
          ..writeAsStringSync(
              '{\n"methods": "",\n"imports": "import \'package:flutter_deriv_api/helpers/helpers.dart\';\\n"\n}');
      }

      methodsJSON = json.decode(methodsFile.readAsStringSync());

      final List<StringBuffer> source = JsonSchemaParser().getClasses(
        SchemaModel.newModelWithChildren(
          children: rootChildren,
          className: className,
        ),
        methodsString: methodsJSON?['methods'] ?? '',
        isRoot: true,
      );

      List<StringBuffer> result =
          _addImports(source: source, imports: methodsJSON?['imports']);

      result = _addLinterSilencers(result);

      final File output =
          File('lib/api/response/${fileBaseName}_response_result.dart');

      !output.existsSync()
          ? output.createSync(recursive: true)
          : output.writeAsStringSync('');

      for (final StringBuffer item in result) {
        output.writeAsStringSync('$item', mode: FileMode.append);
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

List<StringBuffer> _addImports({
  required List<StringBuffer> source,
  required String imports,
}) {
  final String extraImports =
      source.isNotEmpty ? "import 'package:equatable/equatable.dart';\n\n" : '';

  final StringBuffer baseImports = StringBuffer('$extraImports$imports\n');

  return <StringBuffer>[baseImports, ...source];
}

List<StringBuffer> _addLinterSilencers(List<StringBuffer> source) {
  final StringBuffer silencers =
      StringBuffer('// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import\n\n');

  return <StringBuffer>[silencers, ...source];
}
