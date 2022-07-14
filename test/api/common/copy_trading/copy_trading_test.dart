import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/copy_trading/copy_trading_start.dart';
import 'package:flutter_deriv_api/api/common/copy_trading/copy_trading_stop.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('Copy Trading Group ->', () {
    test('Start Copy Trading Test', () async {
      final CopyTradingStart copyTradingStart = await CopyTradingStart.start(
        const CopyStartRequest(copyStart: 'sample_token_3fe45f324ge'),
      );

      expect(copyTradingStart.succeeded, true);
    });

    test('Stop Copy Trading Test', () async {
      final CopyTradingStop copyTradingStop = await CopyTradingStop.stop(
        const CopyStopRequest(copyStop: 'sample_token_3fe45f324ge'),
      );

      expect(copyTradingStop.succeeded, true);
    });
  });
}
