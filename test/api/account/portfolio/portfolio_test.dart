import 'package:flutter_deriv_api/basic_api/generated/portfolio_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/api/response/portfolio_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Portfolio Test', () async {
    final PortfolioResponse portfolio = await PortfolioResponse.fetchPortfolio(
      const PortfolioSend(),
    );

    expect(portfolio.portfolio.contracts.first.currency, 'USD');
    expect(portfolio.portfolio.contracts.first.payout, 10.88);
    expect(portfolio.portfolio.contracts.first.symbol, '1HZ50V');
    expect(portfolio.portfolio.contracts.first.transactionId, 160058875308);
    expect(portfolio.portfolio.contracts.first.contractId, 98350591008);
    expect(portfolio.portfolio.contracts.first.contractType, 'MULTUP');
    expect(portfolio.portfolio.contracts.first.purchaseTime, getDateTime(1587634074));
    expect(portfolio.portfolio.contracts.first.expiryTime, getDateTime(1587761700));
    expect(portfolio.portfolio.contracts.first.expiryTime, getDateTime(1587761700));
    expect(portfolio.portfolio.contracts.first.buyPrice, 10.52);
  });
}
