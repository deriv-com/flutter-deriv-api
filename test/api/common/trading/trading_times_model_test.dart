import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_event_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_times_model.dart';
import 'package:flutter_deriv_api/api/common/trading/trading_times.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('trading times', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final TradingTimes tradingTimes = await TradingTimes.fetchTradingTimes(
      const TradingTimesRequest(tradingTimes: '2015-09-14'),
    );

    expect(tradingTimes.markets.length, 1);

    final MarketModel market = tradingTimes.markets.first;

    expect(market.name, 'Forex');
    expect(market.submarkets.length, 2);

    final SubmarketModel submarket = market.submarkets[1];

    expect(submarket.name, 'Minor Pairs');
    expect(submarket.symbols.length, 2);

    final List<TradeEventModel> events = submarket.symbols.first.events;

    expect(events.length, 1);

    expect(events.first.dates, 'Fridays');
    expect(events.first.description, 'Closes early (at 20:55)');

    final TradeTimesModel times = submarket.symbols.first.times;

    expect(times.close.length, 1);
    expect(times.open.length, 1);

    expect(times.close.first, '00:00:00');
    expect(times.open.first, '23:59:59');

    expect(times.settlement, '23:59:59');
  });
}
