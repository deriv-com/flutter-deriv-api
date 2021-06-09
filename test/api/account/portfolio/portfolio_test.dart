import 'package:flutter_deriv_api/api/account/models/portfolio_contract_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/portfolio/portfolio.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Portfolio Test', () async {
    final Portfolio portfolio = await Portfolio.fetchPortfolio(
      const PortfolioRequest(),
    );
    final PortfolioContractModel contract = portfolio.contracts!.first!;

    expect(contract.currency, 'USD');
    expect(contract.payout, 10.88);
    expect(contract.symbol, '1HZ50V');
    expect(contract.transactionId, 160058875308);
    expect(contract.contractId, 98350591008);
    expect(contract.contractType, ContractType.multUp);
    expect(contract.purchaseTime, getDateTime(1587634074));
    expect(contract.expiryTime, getDateTime(1587761700));
    expect(contract.expiryTime, getDateTime(1587761700));
    expect(contract.buyPrice, 10.52);
  });
}
