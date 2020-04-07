import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/abstraction_classes/contarcts/contarcts_for/contracts_for.dart';
import 'contarcts_for_mock_data.dart';

void main() {
  test('Contracts for json parsing', () async {
    final ContractsFor contractsFor =
        ContractsFor.fromJson(jsonDecode(contractForJson));
    expect(contractsFor.available.first.barriers, 0);
    expect(contractsFor.available.first.maxContractDuration, '1d');
    expect(
      contractsFor.available.first.forwardStartingOptions.first.close,
      1586303999,
    );
    expect(
      contractsFor.available.first.forwardStartingOptions.last.open,
      1586390400,
    );
    expect(contractsFor.available.last.contractType, 'NOTOUCH');
  });
}
