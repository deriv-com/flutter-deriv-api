import 'package:flutter_deriv_api/api/response/copytrading_list_receive_result.dart';
import 'package:flutter_deriv_api/api/response/copytrading_statistics_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/copytrading_statistics_send.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Copy Trading Group ->', () {
    test('Fetch Copy Trading List Test', () async {
      final CopytradingListResponse copyTradingList = await CopytradingListResponse.fetchList();

      expect(copyTradingList.copytradingList.copiers.length, 2);
      expect(copyTradingList.copytradingList.copiers.first.loginid, 'C241542');

      final List<TradersItem> traders = copyTradingList.copytradingList.traders;

      expect(traders.length, 1);
      expect(traders.first.assets.length, 2);
      expect(traders.first.maxTradeStake, 123.3);
      expect(traders.first.token, 'thisisasampletoken');
      expect(traders.first.tradeTypes.length, 2);
    });

    test('Fetch Copy Trading Statistics Test', () async {
      final CopytradingStatisticsResponse copyTradingStatistic =
          await CopytradingStatisticsResponse.fetchStatistics(
        const CopytradingStatisticsSend(traderId: 'CR12345'),
      );

      expect(copyTradingStatistic.copytradingStatistics.copiers, 913);
      expect(copyTradingStatistic.copytradingStatistics.activeSince, getDateTime(1586303999));
      expect(copyTradingStatistic.copytradingStatistics.avgLoss, 37.25);
      expect(copyTradingStatistic.copytradingStatistics.avgProfit, 66.25);
      expect(copyTradingStatistic.copytradingStatistics.tradesBreakdown.length, 1);
      // expect(copyTradingStatistic.copytradingStatistics.tradesBreakdown.first.market, 'forex');
      // expect(copyTradingStatistic.copytradingStatistics.tradesBreakdown.first.breakdown, 152.3);
      // expect(copyTradingStatistic.copytradingStatistics.yearlyProfitableTrades.length, 1);
      // expect(copyTradingStatistic.copytradingStatistics.yearlyProfitableTrades.first.time, '2007');
      // expect(copyTradingStatistic.copytradingStatistics.yearlyProfitableTrades.first.profit, 342.4);
    });
  });
}
