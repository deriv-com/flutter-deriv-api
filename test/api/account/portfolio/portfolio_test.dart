import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/portfolio_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/portfolio_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Portfolio Test', () async {
    final PortfolioResponse portfolio = await PortfolioResponse.fetchPortfolio(
      const PortfolioRequest(contractType: <String>[]),
    );

    expect(portfolio.portfolio?.contracts.first.currency, 'USD');
    expect(portfolio.portfolio?.contracts.first.payout, 10.88);
    expect(portfolio.portfolio?.contracts.first.symbol, '1HZ50V');
    expect(portfolio.portfolio?.contracts.first.transactionId, 160058875308);
    expect(portfolio.portfolio?.contracts.first.contractId, 98350591008);
    expect(portfolio.portfolio?.contracts.first.contractType, 'MULTUP');
    expect(portfolio.portfolio?.contracts.first.purchaseTime, getDateTime(1587634074));
    expect(portfolio.portfolio?.contracts.first.expiryTime, getDateTime(1587761700));
    expect(portfolio.portfolio?.contracts.first.expiryTime, getDateTime(1587761700));
    expect(portfolio.portfolio?.contracts.first.buyPrice, 10.52);
  });
}
