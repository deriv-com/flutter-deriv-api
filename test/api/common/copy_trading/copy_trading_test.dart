import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/copy_trading/copy_trading_start.dart';
import 'package:flutter_deriv_api/api/common/copy_trading/copy_trading_stop.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUpAll(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

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
