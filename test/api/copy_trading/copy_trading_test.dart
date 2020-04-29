import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/copy_trading/copy_trading.dart';
import 'package:flutter_deriv_api/api/models/copy_trading_statistic_model.dart';
import 'package:flutter_deriv_api/api/models/trader_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'copy_trading_list_mock_data.dart';
import 'copy_trading_statistic_mock_data.dart';

void main() {
  test('copy trading list JSON parsing', () {
    final Map<String, dynamic> copyTradingListMap =
        jsonDecode(copyTradingListJSON);
    final CopyTrading copyTrading =
        CopyTrading.fromJson(copyTradingListMap['copytrading_list']);

    expect(copyTrading.copiers.length, 2);
    expect(copyTrading.copiers.first.loginId, 'C241542');

    final List<TraderModel> traders = copyTrading.traders;

    expect(traders.length, 1);
    expect(traders.first.assets.length, 2);
    expect(traders.first.maxTradeStake, 123.3);
    expect(traders.first.token, 'thisisasampletoken');
    expect(traders.first.tradeTypes.length, 2);
  });

  test('copy trading statisticts JSON parsing', () {
    final Map<String, dynamic> copyTradingStatisticsMap =
        jsonDecode(copyTradingStatisticJSON);
    final CopyTradingStatisticModel copyTradingStatistic =
        CopyTradingStatisticModel.fromJson(
            copyTradingStatisticsMap['copytrading_statistics']);

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
}
