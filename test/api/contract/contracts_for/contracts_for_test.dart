import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUp(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  test('Fetch Contracts For Test', () async {
    final ContractsForSymbol contractsFor =
        await ContractsForSymbol.fetchContractsForSymbol(
      const ContractsForRequest(
          contractsFor: 'R_50',
          currency: 'USD',
          landingCompany: 'svg',
          productType: 'basic'),
    );

    final AvailableContractModel firstContract =
        contractsFor.availableContracts.first;

    expect(firstContract.barriers, 0);
    expect(firstContract.maxContractDuration, '1d');
    expect(
      firstContract.forwardStartingOptions.first.close,
      getDateTime(1586303999),
    );
    expect(
      firstContract.forwardStartingOptions.last.open,
      getDateTime(1586390400),
    );
  });
}
