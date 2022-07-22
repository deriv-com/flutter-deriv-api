import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/models/duration_model.dart';
import 'package:flutter_deriv_api/api/common/models/symbol_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_duration_data_model.dart';
import 'package:flutter_deriv_api/api/common/trading/trading_duration.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Trading Duration Test', () async {
    final List<TradingDuration?>? tradeDuration =
        await TradingDuration.fetchTradingDurations(
      const TradingDurationsRequest(),
    );

    final TradingDuration firstTradingDuration = tradeDuration!.first!;
    final MarketModel market = firstTradingDuration.market!;
    final SubmarketModel submarket = firstTradingDuration.submarket!;
    final TradingDurationDataModel tradingDurationData =
        tradeDuration.first!.tradingDurationData![1]!;
    final SymbolModel symbol = tradingDurationData.symbols!.first!;
    final DurationModel duration =
        tradingDurationData.tradeDurations![6]!.durations!.first!;

    expect(tradeDuration.length, 2);

    expect(market.displayName, 'Forex');
    expect(market.name, 'forex');

    expect(submarket.displayName, 'Major Pairs');
    expect(submarket.name, 'major_pairs');

    expect(firstTradingDuration.tradingDurationData!.length, 2);

    expect(tradingDurationData.symbols!.length, 1);
    expect(tradingDurationData.tradeDurations!.length, 8);

    expect(symbol.displayName, 'GBP/USD');
    expect(symbol.name, 'frxGBPUSD');

    expect(duration.displayName, 'Days');
    expect(duration.max, 365);
    expect(duration.min, 1);
    expect(duration.name, 'days');
  });
}
