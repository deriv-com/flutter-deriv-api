import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_currency/set_account_currency.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUp(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  test('Set Account Currency Test', () async {
    final SetAccountCurrency setAccountCurrency =
        await SetAccountCurrency.setCurrency(
      const SetAccountCurrencyRequest(setAccountCurrency: 'USD'),
    );

    expect(setAccountCurrency.succeeded, true);
  });
}
