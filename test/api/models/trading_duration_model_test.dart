import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/symbol_model.dart';
import 'package:flutter_deriv_api/api/models/duration_model.dart';
import 'package:flutter_deriv_api/api/trading/trading_duration.dart';
import 'package:flutter_deriv_api/api/models/trading_duration_data_model.dart';

import 'trading_duration_model_mock_data.dart';

void main() {
  test('trade duration json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(tradingDurationModelMockData);
    final TradingDuration tradeDuration =
        TradingDuration.fromJson(mapData['trading_durations'][0]);

    expect(tradeDuration.market.displayName, 'Forex');
    expect(tradeDuration.market.name, 'forex');

    expect(tradeDuration.submarket.displayName, 'Major Pairs');
    expect(tradeDuration.submarket.name, 'major_pairs');

    expect(tradeDuration.tradingDurationData.length, 3);

    final TradingDurationDataModel tradingDurationData =
        tradeDuration.tradingDurationData[1];

    expect(tradingDurationData.symbols.length, 12);

    final SymbolModel symbol = tradingDurationData.symbols[5];

    expect(tradingDurationData.tradeDurations.length, 9);

    final DurationModel duration =
        tradingDurationData.tradeDurations[6].durations[0];

    expect(symbol.displayName, 'EUR/GBP');
    expect(symbol.name, 'frxEURGBP');

    expect(duration.displayName, 'Days');
    expect(duration.max, 365);
    expect(duration.min, 1);
    expect(duration.name, 'days');
  });
}
