import 'package:flutter_deriv_api/api/account/models/portfolio_contract_model.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/portfolio/portfolio.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Portfolio Test', () async {
    final Portfolio portfolio = await Portfolio.fetchPortfolio(
      const PortfolioRequest(contractType: <String>['MULTUP']),
    );

    final PortfolioContractModel firstContract = portfolio.contracts!.first!;

    expect(firstContract.currency, 'USD');
    expect(firstContract.payout, 10.88);
    expect(firstContract.symbol, '1HZ50V');
    expect(firstContract.transactionId, 160058875308);
    expect(firstContract.contractId, 98350591008);
    expect(firstContract.contractType, ContractType.multUp);
    expect(firstContract.purchaseTime, getDateTime(1587634074));
    expect(firstContract.expiryTime, getDateTime(1587761700));
    expect(firstContract.expiryTime, getDateTime(1587761700));
    expect(firstContract.buyPrice, 10.52);
  });
}
