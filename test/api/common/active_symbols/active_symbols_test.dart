import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('Active Symbols test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final List<ActiveSymbol> activeSymbols =
        await ActiveSymbol.fetchActiveSymbols(
      const ActiveSymbolsRequest(
        activeSymbols: 'brief',
        productType: 'basic',
      ),
    );

    expect(activeSymbols.first.pip, 0.001);
    expect(activeSymbols.first.symbolType, 'smart_fx');
    expect(activeSymbols.first.isTradingSuspended, false);
    expect(activeSymbols.first.symbol, 'WLDAUD');
    expect(activeSymbols[0].exchangeIsOpen, true);
  });
}
