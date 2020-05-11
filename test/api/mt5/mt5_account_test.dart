import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_account.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  group('mt5 account group ->', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('create new account test', () async {
      final MT5Account mt5Account = await MT5Account.createNewAccount(
        request: const Mt5NewAccountRequest(
          mt5NewAccount: 1,
          accountType: 'gaming',
          address: 'Dummy address',
          city: 'Valletta',
          company: 'Binary Limited',
          country: 'mt',
          email: 'test@mailinator.com',
          investPassword: 'AbcDv12345@',
          leverage: 100,
          mainPassword: 'AbcDv1234@',
          mt5AccountType: 'advanced',
          name: 'Peter Pan',
          phone: '+6123456789',
          phonePassword: 'AbcDv1234',
          state: 'Valleta',
          zipCode: 'VLT 1117',
        ),
      );

      expect(mt5Account.accountType, AccountType.gaming);
      expect(mt5Account.balance, 350.0);
      expect(mt5Account.currency, 'USD');
      expect(mt5Account.displayBalance, '350.0');
      expect(mt5Account.login, 'MT346525');
      expect(mt5Account.mt5AccountType, MT5AccountType.advanced);
    });

    test('mt5 login list test', () async {
      final List<MT5Account> mt5LoginList = await MT5Account.fetchLoginList(
        request: const Mt5LoginListRequest(
          mt5LoginList: 1,
        ),
      );

      expect(mt5LoginList.length, 1);

      expect(mt5LoginList.first.balance, 350.0);
      expect(mt5LoginList.first.country, 'India');
      expect(mt5LoginList.first.currency, 'USD');
      expect(mt5LoginList.first.displayBalance, '350.0');
      expect(mt5LoginList.first.email, 'test@example.com');
      expect(mt5LoginList.first.group, 'svg_standard');
      expect(mt5LoginList.first.leverage, 100);
      expect(mt5LoginList.first.login, 'MT346525');
      expect(mt5LoginList.first.name, 'Jon Doe');
    });
  });
}
