import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/manually/tick_history_subscription.dart';
import 'package:flutter_deriv_api/api/response/ticks_history_response_result.dart';
import 'package:flutter_deriv_api/api/response/ticks_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_history_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  group('Ticks Group ->', () {
    test('Tick Stream Test', () {
      TicksResponse.subscribeTick(const TicksRequest(ticks: 'R_50')).listen(
        expectAsync1(
          (TicksResponse? tick) {
            expect(tick?.tick?.ask, 218.1026);
            expect(tick?.tick?.bid, 218.0826);
            expect(tick?.tick?.id, 'b4d42748-0744-c46b-f59b-cb7dd936bafa');
            expect(tick?.tick?.symbol, 'R_50');
            expect(tick?.tick?.epoch, getDateTime(1587547610));
          },
        ),
      );
    });

    test('Tick History Test', () async {
      final TicksHistoryResponse history =
          await TicksHistoryResponse.fetchTickHistory(
        const TicksHistoryRequest(
          ticksHistory: 'R_50',
          adjustStartTime: 1,
          count: 10,
          end: 'latest',
          start: 1,
          style: 'ticks',
        ),
      );

      final List<double>? prices = history.history?.prices;
      final List<DateTime>? times = history.history?.times!;

      expect(prices?.length, 6);
      expect(prices?.first, 218.6404);
      expect(times?.length, 6);
      expect(times?.first, getDateTime(1587556946));
    });

    test('TickHistorySubscription Without Stream Test', () async {
      final TickHistorySubscription? tickHistory =
          await TicksHistoryResponse.fetchTicksAndSubscribe(
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

      final TicksHistoryResponse? history = tickHistory?.tickHistory;

      expect(history?.pipSize, 4);

      final List<double?> prices = history!.history!.prices!;
      final List<DateTime?> times = history.history!.times!;
      expect(prices.length, 6);
      expect(prices.first, 218.6404);
      expect(times.length, 6);
      expect(times.first, getDateTime(1587556946));
    });

    // TODO(ramin): Test for history subscription when MOCK API supports it
  });
}
