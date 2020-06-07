import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';

import 'api_builder.dart';

Builder apiHelperBuilder(final BuilderOptions _) => APIHelperBuilder();

/// A Code generator class runs after [APIBuilder] for generating the `api.helper.dart`
///
/// The generated file includes the function `getResponseByMsgType` which instantiates
/// the appropriate sub-class of [Response] based on its [Response.msgType]
class APIHelperBuilder extends Builder {
  @override
  Map<String, List<String>> get buildExtensions => const <String, List<String>>{
        '.dart': <String>['.helper.dart']
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    try {
      final List<String> importFileNames = generatedResponses
          .map<String>((GeneratedResponseJson response) => response.fileName)
          .toList()
            ..add('../response')
            ..sort();

      generatedResponses.sort();

      await buildStep.writeAsString(
        buildStep.inputId.changeExtension('.helper.dart'),
        DartFormatter().format(
          '''
            // AUTO-GENERATED - DO NOT MODIFY BY HAND
            // Auto generated from 1st step of the flutter_deriv_api code generation process
            // uses collected `msg_type`s from the 1st step to create a helper
            // function that maps the `msg_type`s to equivalent Response objects
            
            ${importFileNames.map((String fileName) => 'import \'$fileName.dart\';').join('\n')}

            /// A function that create a sub-type of [Response] based on
            /// [responseMap]'s 'msg_type' 
            Response getResponseByMsgType(Map<String, dynamic> responseMap) {
              switch (responseMap['msg_type']) {
              ${generatedResponses.map((GeneratedResponseJson response) => '''case '${response.msgType}':
                return ${response.fullClassName}.fromJson(responseMap);
              ''').join('')}

              default:
                return Response.fromJson(responseMap);
              }
            }
          ''',
        ),
      );
    } on Exception catch (e, stack) {
      log
        ..severe('Failed to process ${buildStep.inputId} - $e')
        ..severe('Stack trace $stack');
      return;
    }
  }
}
