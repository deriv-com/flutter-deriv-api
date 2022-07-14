import 'package:flutter_deriv_api/api/account/models/copier_model.dart';
import 'package:flutter_deriv_api/api/account/models/market_trades_breakdown_model.dart';
import 'package:flutter_deriv_api/api/account/models/profitable_trade_model.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/copy_trading/copy_trading_list.dart';
import 'package:flutter_deriv_api/api/account/copy_trading/copy_trading_statistics.dart';
import 'package:flutter_deriv_api/api/account/models/trader_model.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('Copy Trading Group ->', () {
    test('Fetch Copy Trading List Test', () async {
      final CopyTradingList copyTradingList = await CopyTradingList.fetchList();

      final List<CopierModel?> copiers = copyTradingList.copiers!;
      final CopierModel firstCopier = copiers.first!;

      expect(copiers.length, 2);
      expect(firstCopier.loginId, 'C241542');

      final List<TraderModel?> traders = copyTradingList.traders!;
      final TraderModel trader = traders.first!;

      expect(traders.length, 1);
      expect(trader.assets!.length, 2);
      expect(trader.maxTradeStake, 123.3);
      expect(trader.token, 'thisisasampletoken');
      expect(trader.tradeTypes!.length, 2);
    });

    test('Fetch Copy Trading Statistics Test', () async {
      final CopyTradingStatistics copyTradingStatistic =
          await CopyTradingStatistics.fetchStatistics(
        const CopytradingStatisticsRequest(traderId: 'CR12345'),
      );

      final List<MarketTradesBreakdownModel?> tradesBreakdown =
          copyTradingStatistic.tradesBreakdown!;
      final MarketTradesBreakdownModel firstTradesBreakdown =
          tradesBreakdown.first!;
      final List<ProfitableTradeModel?> yearlyProfitableTrades =
          copyTradingStatistic.yearlyProfitableTrades!;
      final ProfitableTradeModel firstYearlyProfitableTrades =
          yearlyProfitableTrades.first!;

      expect(copyTradingStatistic.copiers, 913);
      expect(copyTradingStatistic.activeSince, getDateTime(1586303999));
      expect(copyTradingStatistic.avgLoss, 37.25);
      expect(copyTradingStatistic.avgProfit, 66.25);
      expect(tradesBreakdown.length, 1);
      expect(firstTradesBreakdown.market, 'forex');
      expect(firstTradesBreakdown.breakdown, 152.3);
      expect(yearlyProfitableTrades.length, 1);
      expect(firstYearlyProfitableTrades.time, '2007');
      expect(firstYearlyProfitableTrades.profit, 342.4);
    });
  });
}
