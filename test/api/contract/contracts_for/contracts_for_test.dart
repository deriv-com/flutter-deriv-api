import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('Contracts for JSON parsing', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final ContractsForSymbol contractsFor =
        await ContractsForSymbol.getContractsForSymbol(
            const ContractsForRequest());

    expect(contractsFor.contracts.first.barriers, 0);
    expect(contractsFor.contracts.first.maxContractDuration, '1d');
    expect(
      contractsFor.contracts.first.forwardStartingOptions.first.close,
      getDateTime(1586303999),
    );
    expect(
      contractsFor.contracts.first.forwardStartingOptions.last.open,
      getDateTime(1586390400),
    );
  });
}
