import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/cashier/cashier_information.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('Cashier URL', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final CashierInformation cashierInformation =
        await CashierInformation.fetchInformation(
      const CashierRequest(
        cashier: 'deposit',
        provider: 'provider1',
        verificationCode: '12123hjdshad',
      ),
    );

    expect(
      cashierInformation.cashierURL,
      'http://example.url/sagsjgajshkjHSas',
    );
  });
}
