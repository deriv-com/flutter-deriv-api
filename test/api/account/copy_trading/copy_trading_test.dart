import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/copy_trading/copy_trading_list.dart';
import 'package:flutter_deriv_api/api/account/copy_trading/copy_trading_statistics.dart';
import 'package:flutter_deriv_api/api/account/models/trader_model.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Copy Trading Group ->', () {
    test('Fetch Copy Trading List Test', () async {
      final CopyTradingList copyTradingList = await CopyTradingList.fetchList();

      expect(copyTradingList.copiers.length, 2);
      expect(copyTradingList.copiers.first.loginId, 'C241542');

      final List<TraderModel> traders = copyTradingList.traders;

      expect(traders.length, 1);
      expect(traders.first.assets.length, 2);
      expect(traders.first.maxTradeStake, 123.3);
      expect(traders.first.token, 'thisisasampletoken');
      expect(traders.first.tradeTypes.length, 2);
    });

    test('Fetch Copy Trading Statistics Test', () async {
      final CopyTradingStatistics copyTradingStatistic =
          await CopyTradingStatistics.fetchStatistics(
        const CopytradingStatisticsRequest(traderId: 'CR12345'),
      );

      expect(copyTradingStatistic.copiers, 913);
      expect(copyTradingStatistic.activeSince, getDateTime(1586303999));
      expect(copyTradingStatistic.avgLoss, 37.25);
      expect(copyTradingStatistic.avgProfit, 66.25);
      expect(copyTradingStatistic.tradesBreakdown.length, 1);
      expect(copyTradingStatistic.tradesBreakdown.first.market, 'forex');
      expect(copyTradingStatistic.tradesBreakdown.first.breakdown, 152.3);
      expect(copyTradingStatistic.yearlyProfitableTrades.length, 1);
      expect(copyTradingStatistic.yearlyProfitableTrades.first.time, '2007');
      expect(copyTradingStatistic.yearlyProfitableTrades.first.profit, 342.4);
    });
  });
}
