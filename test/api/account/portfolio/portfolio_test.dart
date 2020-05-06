import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/portfolio/portfolio.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'portfolio_mock_data.dart';

void main() {
  test('Portfolio JSON parsing', () {
    final Map<String, dynamic> portfolioMap = jsonDecode(portfolioJSON);
    final Portfolio portfolio = Portfolio.fromJson(portfolioMap['portfolio']);

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
