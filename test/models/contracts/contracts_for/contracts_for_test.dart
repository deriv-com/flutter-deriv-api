import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/logic/contarcts/contarcts_for/contracts_for_symbol.dart';
import 'contarcts_for_mock_data.dart';

void main() {
  test('Contracts for json parsing', () async {
    final ContractsForSymbol contractsFor =
        ContractsForSymbol.fromJson(jsonDecode(contractForSymbolJson));
    expect(contractsFor.contracts.first.barriers, 0);
    expect(contractsFor.contracts.first.maxContractDuration, '1d');
    expect(
      contractsFor.contracts.first.forwardStartingOptions.first.close
              .millisecondsSinceEpoch /
          1000,
      1586303999,
    );
    expect(
      contractsFor.contracts.first.forwardStartingOptions.last.open
              .millisecondsSinceEpoch /
          1000,
      1586390400,
    );
    expect(contractsFor.contracts.last.contractType, 'NOTOUCH');
  });
}
