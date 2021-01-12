import 'package:flutter_deriv_api/api/response/copy_start_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/copy_start_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/copy_stop_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/response/copy_stop_receive_result.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';


void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Copy Trading Group ->', () {
    test('Start Copy Trading Test', () async {
      final CopyStartResponse copyTradingStart = await CopyStartResponse.start(
        const CopyStartSend(copyStart: 'sample_token_3fe45f324ge'),
      );

      expect(copyTradingStart.copyStart, 1);
    });

    test('Stop Copy Trading Test', () async {
      final CopyStopResponse copyTradingStop = await CopyStopResponse.stop(
        const CopyStopSend(copyStop: 'sample_token_3fe45f324ge'),
      );

      expect(copyTradingStop.copyStop, 1);
    });
  });
}
