import 'package:flutter_deriv_api/basic_api/generated/trading_durations_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/trading_durations_receive_result.dart';


void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Trading Duration Test', () async {
    final TradingDurationsResponse tradeDuration =
        await TradingDurationsResponse.fetchTradingDurations(
      const TradingDurationsSend(),
    );

    expect(tradeDuration.tradingDurations.length, 2);

    expect(tradeDuration.tradingDurations.first.market.displayName, 'Forex');
    expect(tradeDuration.tradingDurations.first.market.name, 'forex');

    expect(tradeDuration.tradingDurations.first.submarket.displayName, 'Major Pairs');
    expect(tradeDuration.tradingDurations.first.submarket.name, 'major_pairs');

    expect(tradeDuration.tradingDurations.length, 2);

    // TODO(mohammad): wating for backend team to fix the response.

    // final TradeDurationsItem tradingDurationData =
    //     tradeDuration.tradingDurations.first.tradeDurations.first;

    //expect(tradingDurationData.symbols.length, 1);

   // final SymbolModel symbol = tradingDurationData.symbols.first;

 //   expect(tradingDurationData.durations.length, 8);

    // final DurationsItem duration =
    //     tradingDurationData.durations[6];

    // expect(symbol.displayName, 'GBP/USD');
    // expect(symbol.name, 'frxGBPUSD');

    // expect(duration.displayName, 'Days');
    // expect(duration.max, 365);
    // expect(duration.min, 1);
    // expect(duration.name, 'days');
  });
}
