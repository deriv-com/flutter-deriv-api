import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/portfolio/portfolio.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Portfolio Test', () async {
    final Portfolio portfolio = await Portfolio.fetchPortfolio(
      const PortfolioRequest(),
    );

    expect(portfolio.contracts.first.currency, 'USD');
    expect(portfolio.contracts.first.payout, 10.88);
    expect(portfolio.contracts.first.symbol, 'frxEURGBP');
    expect(portfolio.contracts.first.transactionId, 160058875308);
    expect(portfolio.contracts.first.contractId, 80080459208);
    expect(portfolio.contracts.first.contractType, 'PUT');
    expect(portfolio.contracts.first.purchaseTime, getDateTime(1587634074));
    expect(portfolio.contracts.first.expiryTime, getDateTime(1587761700));
    expect(portfolio.contracts.first.expiryTime, getDateTime(1587761700));
    expect(portfolio.contracts.first.buyPrice, 10.0);
  });
}
