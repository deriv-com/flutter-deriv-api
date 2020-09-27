import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_event_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_times_model.dart';
import 'package:flutter_deriv_api/api/common/trading/trading_times.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Trading Times Test', () async {
    final TradingTimes tradingTimes = await TradingTimes.fetchTradingTimes(
      const TradingTimesRequest(tradingTimes: '2015-09-14'),
    );

    expect(tradingTimes.markets.length, 1);

    final MarketModel market = tradingTimes.markets.first;

    expect(market.name, 'Forex');
    expect(market.submarkets.length, 1);

    final SubmarketModel submarket = market.submarkets.first;

    expect(submarket.name, 'Major Pairs');
    expect(submarket.symbols.length, 1);

    final List<TradeEventModel> events = submarket.symbols.first.events;

    expect(events.length, 1);

    expect(events.first.dates, 'Fridays');
    expect(events.first.description, 'Closes early (at 20:55)');

    final TradeTimesModel times = submarket.symbols.first.times;

    expect(times.close.length, 1);
    expect(times.open.length, 1);

    expect(times.open.first, '00:00:00');
    expect(times.close.first, '23:59:59');

    expect(times.settlement, '23:59:59');
  });
}
