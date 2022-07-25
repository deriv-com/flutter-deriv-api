import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/trading_times_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_times_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Trading Times Test', () async {
    final TradingTimesResponse tradingTimes =
        await TradingTimesResponse.fetchTradingTimes(
      const TradingTimesRequest(tradingTimes: '2015-09-14'),
    );

    expect(tradingTimes.tradingTimes?.markets.length, 1);

    final MarketsItem market = tradingTimes.tradingTimes!.markets.first;

    expect(market.name, 'Forex');
    expect(market.submarkets?.length, 1);

    final SubmarketsItem submarket = market.submarkets!.first;

    expect(submarket.name, 'Major Pairs');
    expect(submarket.symbols?.length, 1);

    // final List<TradeEventModel>? events = submarket.symbols!.first.events;

    // expect(events.length, 1);

    // expect(events.first.dates, 'Fridays');
    // expect(events.first.description, 'Closes early (at 20:55)');

    // final TradeTimesModel? times = submarket.symbols?.first.times;

    // expect(times.close.length, 1);
    // expect(times.open.length, 1);

    // expect(times.open.first, '00:00:00');
    // expect(times.close.first, '23:59:59');

    // expect(times.settlement, '23:59:59');
  });
}
