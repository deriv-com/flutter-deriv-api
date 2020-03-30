import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';

import 'api_builder.dart';

Builder apiHelperBuilder(final BuilderOptions _) => APIHelperBuilder();

class APIHelperBuilder extends Builder {
  @override
  Map<String, List<String>> get buildExtensions => const <String, List<String>>{
        '.dart': <String>['.helper.dart']
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    try {
      await buildStep.writeAsString(
          buildStep.inputId.changeExtension('.helper.dart'),
          DartFormatter().format('''// AUTO-GENERATED - DO NOT MODIFY BY HAND
          // Auto generated from 1st step of the flutter_deriv_api code generation process
          // uses collected `msg_type`s from the 1st step to create a helper
          // function that maps the `msg_type`s to equivalent Response objects
          
          import 'response.dart';
      ${generatedResponses.map((GeneratedResponseJson gj) => 'import \'${gj.fileName}.dart\';').join('\n')}
      
      /// A function that create a sub-type of [Response] based on
      /// [responseMap]'s 'msg_type' 
      Response getResponseByMsgType(Map<String, dynamic> responseMap) {
        switch (responseMap['msg_type']) {
        ${generatedResponses.map((GeneratedResponseJson rj) => '''case '${rj.msgType}':
            return ${rj.fullClassName}.fromJson(responseMap);
         ''').join('')}
         default:
            return Response.fromJson(responseMap);
        }
      }
      '''));
    } on Exception catch (e, stack) {
      log
        ..severe('Failed to process ${buildStep.inputId} - $e')
        ..severe('Stack trace $stack');
      return;
    }
  }
}
