import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/mt5/mt5_deposit.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('mt5 deposit test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final MT5Deposit mt5Deposit = await MT5Deposit.deposit(
      request: const Mt5DepositRequest(
        amount: 1000,
        fromBinary: 'CR100001',
        mt5Deposit: 1,
        toMt5: 'MTR1000',
      ),
    );

    expect(mt5Deposit.mt5Deposit, true);
    expect(mt5Deposit.binaryTransactionId, 3487342);
  });
}
