import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_api/api/common/tick/tick_history.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  setUpAll(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  group('Ticks Group ->', () {
    test('Tick Stream Test', () {
      Tick.subscribeTick(const TicksRequest(ticks: 'R_50')).take(1).listen(
        expectAsync1(
          (Tick tick) {
            expect(tick.ask, 218.1026);
            expect(tick.bid, 218.0826);
            expect(tick.id, 'b4d42748-0744-c46b-f59b-cb7dd936bafa');
            expect(tick.symbol, 'R_50');
            expect(tick.epoch, getDateTime(1587547610));
          },
        ),
      );
    });

    test('Tick History Test', () async {
      final TickHistory history = await TickHistory.fetchTickHistory(
        const TicksHistoryRequest(),
      );

      expect(history.pipSize, 4);

      expect(history.history.prices.length, 6);
      expect(history.history.prices.first, 218.6404);
      expect(history.history.times.length, 6);
      expect(history.history.times.first, getDateTime(1587556946));
    });
  });
}
