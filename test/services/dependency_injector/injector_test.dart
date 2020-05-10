import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

// Just a test to examine the usage of Dependency Injection in the project
void main() {
  test('Injector test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final List<ActiveSymbol> symbols = await ActiveSymbol.getActiveSymbols();

    print('number of available symbols: ${symbols?.length}');

    final ContractsForSymbol contractsForSymbol =
        await ContractsForSymbol.getContractsForSymbol(
      const ContractsForRequest(contractsFor: 'R_10'),
    );

    print(
      'number of contract for R_10: ${contractsForSymbol?.contracts?.length}',
    );
  });
}
