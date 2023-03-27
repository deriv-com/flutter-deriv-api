import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/copy_start_response_result.dart';
import 'package:flutter_deriv_api/api/response/copy_stop_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/copy_start_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/copy_stop_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  group('Copy Trading Group ->', () {
    test('Start Copy Trading Test', () async {
      final CopyStartResponse copyTradingStart = await CopyStartResponse.start(
        const CopyStartRequest(copyStart: 'sample_token_3fe45f324ge'),
      );

      expect(copyTradingStart.copyStart, 1);
    });

    test('Stop Copy Trading Test', () async {
      final CopyStopResponse copyTradingStop = await CopyStopResponse.stop(
        const CopyStopRequest(copyStop: 'sample_token_3fe45f324ge'),
      );

      expect(copyTradingStop.copyStop, 1);
    });
  });
}
