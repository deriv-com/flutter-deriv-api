import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_api/api/common/tick/tick_history.dart';
import 'package:flutter_deriv_api/api/common/tick/tick_history_subscription.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Ticks Group ->', () {
    test('Tick Stream Test', () {
      Tick.subscribeTick(const TicksRequest(ticks: 'R_50')).listen(
        expectAsync1(
          (Tick? tick) {
            expect(tick!.ask, 218.1026);
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
        const TicksHistoryRequest(
          ticksHistory: 'R_50',
          adjustStartTime: 1,
          count: 10,
          end: 'latest',
          start: 1,
          style: 'ticks',
        ),
      );

      expect(history.pipSize, 4);

      expect(history.history!.prices!.length, 6);
      expect(history.history!.prices!.first, 218.6404);
      expect(history.history!.times!.length, 6);
      expect(history.history!.times!.first, getDateTime(1587556946));
    });

    test('TickHistorySubscription Without Stream Test', () async {
      final TickHistorySubscription? tickHistory =
          await TickHistory.fetchTicksAndSubscribe(
        const TicksHistoryRequest(
          ticksHistory: 'R_50',
          adjustStartTime: 1,
          count: 10,
          end: 'latest',
          start: 1,
          style: 'ticks',
        ),
        subscribe: false,
      );

      final TickHistory history = tickHistory!.tickHistory!;

      expect(history.pipSize, 4);

      expect(history.history!.prices!.length, 6);
      expect(history.history!.prices!.first, 218.6404);
      expect(history.history!.times!.length, 6);
      expect(history.history!.times!.first, getDateTime(1587556946));
    });

    // TODO(ramin): Test for history subscription when MOCK API supports it
  });
}
