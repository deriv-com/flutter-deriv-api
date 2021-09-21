import 'package:flutter_deriv_api/api/response/copytrading_list_response_result.dart';
import 'package:flutter_deriv_api/api/response/copytrading_statistics_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/copytrading_statistics_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Copy Trading Group ->', () {
    test('Fetch Copy Trading List Test', () async {
      final CopytradingListResponse copyTradingList =
          await CopytradingListResponse.fetchList();

      expect(copyTradingList.copytradingList?.copiers.length, 2);
      expect(copyTradingList.copytradingList?.copiers.first.loginid, 'C241542');

      final List<TradersItem>? traders =
          copyTradingList.copytradingList?.traders;
      final TradersItem? trader = traders?.first;

      expect(traders?.length, 1);
      expect(trader?.assets!.length, 2);
      expect(trader?.maxTradeStake, 123.3);
      expect(trader?.token, 'thisisasampletoken');
      expect(trader?.tradeTypes!.length, 2);
    });

    test('Fetch Copy Trading Statistics Test', () async {
      final CopytradingStatisticsResponse copyTradingStatistic =
          await CopytradingStatisticsResponse.fetchStatistics(
        const CopytradingStatisticsRequest(traderId: 'CR12345'),
      );

      // final List<MarketTradesBreakdownModel>? tradesBreakdown =
      //     copyTradingStatistic.copytradingStatistics.tradesBreakdown;
      // final MarketTradesBreakdownModel firstTradesBreakdown =
      //     tradesBreakdown.first!;
      // final List<ProfitableTradeModel?> yearlyProfitableTrades =
      //     copyTradingStatistic.yearlyProfitableTrades!;
      // final ProfitableTradeModel firstYearlyProfitableTrades =
      //    yearlyProfitableTrades.first!;

      expect(copyTradingStatistic.copytradingStatistics?.copiers, 913);
      expect(copyTradingStatistic.copytradingStatistics?.activeSince,
          getDateTime(1586303999));
      expect(copyTradingStatistic.copytradingStatistics?.avgLoss, 37.25);
      expect(copyTradingStatistic.copytradingStatistics?.avgProfit, 66.25);
      expect(copyTradingStatistic.copytradingStatistics?.tradesBreakdown.length,
          1);
      expect(
          copyTradingStatistic
              .copytradingStatistics?.tradesBreakdown.keys.first,
          'forex');
      expect(
          copyTradingStatistic
              .copytradingStatistics?.tradesBreakdown.values.first,
          152.3);
      expect(
          copyTradingStatistic
              .copytradingStatistics?.yearlyProfitableTrades?.length,
          1);
      expect(
          copyTradingStatistic
              .copytradingStatistics?.yearlyProfitableTrades?.entries.first.key,
          '2007');
      expect(
          copyTradingStatistic.copytradingStatistics?.yearlyProfitableTrades
              ?.entries.first.value,
          342.4);
    });
  });
}
