import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/trading_durations_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_durations_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Trading Duration Test', () async {
    final TradingDurationsResponse tradeDuration =
        await TradingDurationsResponse.fetchTradingDurations(
      const TradingDurationsRequest(),
    );

    expect(tradeDuration.tradingDurations?.length, 8);

    final TradeDurationsItem? tradingDurationData =
        tradeDuration.tradingDurations?.first.data?.first.tradeDurations?.first;

    final TradeType symbol = tradingDurationData!.tradeType!;

    expect(tradingDurationData.durations?.length, 3);

    final DurationsItem duration = tradingDurationData.durations!.first;

    expect(symbol.displayName, 'Rise/Fall');
    expect(symbol.name, 'rise_fall');

    expect(duration.displayName, 'Minutes');
    expect(duration.max, 1440);
    expect(duration.min, 5);
    expect(duration.name, 'm');
  });
}
