import 'package:flutter_deriv_api/basic_api/generated/active_symbols_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Active Symbols Test', () async {
    final ActiveSymbolsResponse activeSymbols =
        await ActiveSymbolsResponse.fetchActiveSymbols(
      const ActiveSymbolsRequest(
        activeSymbols: 'brief',
        productType: 'basic',
      ),
    );

    expect(activeSymbols.activeSymbols?.first.pip, 0.001);
    expect(activeSymbols.activeSymbols?.first.symbolType, 'smart_fx');
    expect(activeSymbols.activeSymbols?.first.isTradingSuspended, false);
    expect(activeSymbols.activeSymbols?.first.symbol, 'WLDAUD');
    expect(activeSymbols.activeSymbols?.first.exchangeIsOpen, true);
  });
}
