import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(true));

  test('Fetch Active Symbols Test', () async {
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
