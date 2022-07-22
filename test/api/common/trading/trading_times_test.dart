import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_event_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_times_model.dart';
import 'package:flutter_deriv_api/api/common/trading/trading_times.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Trading Times Test', () async {
    final TradingTimes tradingTimes = await TradingTimes.fetchTradingTimes(
      const TradingTimesRequest(tradingTimes: '2015-09-14'),
    );

    expect(tradingTimes.markets!.length, 1);

    final MarketModel market = tradingTimes.markets!.first!;
    final SubmarketModel submarket = market.submarkets!.first!;
    final List<TradeEventModel?> events = submarket.symbols!.first!.events!;
    final TradeEventModel firstEvent = submarket.symbols!.first!.events!.first!;
    final TradeTimesModel times = submarket.symbols!.first!.times!;
    final List<String?> openTimes = submarket.symbols!.first!.times!.open!;
    final List<String?> closeTimes = submarket.symbols!.first!.times!.close!;

    expect(market.name, 'Forex');
    expect(market.submarkets!.length, 1);

    expect(submarket.name, 'Major Pairs');
    expect(submarket.symbols!.length, 1);

    expect(events.length, 1);

    expect(firstEvent.dates, 'Fridays');
    expect(firstEvent.description, 'Closes early (at 20:55)');

    expect(openTimes.length, 1);
    expect(openTimes.first, '00:00:00');

    expect(closeTimes.length, 1);
    expect(closeTimes.first, '23:59:59');

    expect(times.settlement, '23:59:59');
  });
}
