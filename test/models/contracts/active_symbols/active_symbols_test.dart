import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/abstraction_classes/contarcts/active_symbols/active_symbols.dart';
import 'active_symbols_mock_data.dart';

void main() {
  test('Active Symbols json parsing', () async {
    final Map<String, dynamic> activeSymbolsMap = jsonDecode(activeSymbolsJson);
    final List<ActiveSymbol> activeSymbols = activeSymbolsMap['active_symbols']
        .map<ActiveSymbol>((dynamic entry) => ActiveSymbol.fromJson(entry))
        .toList();
    expect(activeSymbols.first.pip, 0.001);
    expect(activeSymbols.first.symbolType, 'smart_fx');
    expect(activeSymbols.first.isTradingSuspended, 0);
    expect(activeSymbols.first.symbol, 'WLDAUD');
  });
}
