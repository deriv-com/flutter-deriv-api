import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/market_model.dart';
import 'package:flutter_deriv_api/api/trading/trading_times.dart';
import 'package:flutter_deriv_api/api/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/models/trade_event_model.dart';
import 'package:flutter_deriv_api/api/models/trade_times_model.dart';

import 'trading_times_model_mock_data.dart';

void main() {
  test('trading times json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(tradingTimesModelMockData);
    final TradingTimes tradingTimes =
        TradingTimes.fromJson(mapData['trading_times']);

    expect(tradingTimes.markets.length, 4);

    final MarketModel market = tradingTimes.markets[2];

    expect(market.name, 'Commodities');
    expect(market.submarkets.length, 2);

    final SubmarketModel submarket = market.submarkets[1];

    expect(submarket.name, 'Energy');
    expect(submarket.symbols.length, 1);

    final List<TradeEventModel> events = submarket.symbols[0].events;

    expect(events.length, 1);

    expect(events[0].dates, 'Fridays');
    expect(events[0].description, 'Closes early (at 20:55)');

    final TradeTimesModel times = submarket.symbols[0].times;

    expect(times.close.length, 1);
    expect(times.open.length, 1);

    expect(times.close[0], '07:15:00');
    expect(times.open[0], '18:30:00');

    expect(times.settlement, '23:59:59');
  });
}
