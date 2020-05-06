import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'active_symbols_mock_data.dart';

void main() {
  test('Active Symbols JSON parsing', () async {
    final Map<String, dynamic> activeSymbolsMap = jsonDecode(activeSymbolsJson);
    final List<ActiveSymbol> activeSymbols = getListFromMap(
      activeSymbolsMap['active_symbols'],
      itemToTypeCallback: (dynamic item) => ActiveSymbol.fromJson(item),
    );

    expect(activeSymbols.first.pip, 0.001);
    expect(activeSymbols.first.symbolType, 'smart_fx');
    expect(activeSymbols.first.isTradingSuspended, false);
    expect(activeSymbols.first.symbol, 'WLDAUD');
    expect(activeSymbols[0].exchangeIsOpen, true);
  });
}
