import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_account.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_deposit.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_change.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_check.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_reset.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_settings.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_withdrawal.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('MT5 Account Group ->', () {
    test('Create New MT5 Account Test', () async {
      final MT5Account mt5Account = await MT5Account.createNewAccount(
        const Mt5NewAccountRequest(
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

    test('MT5 Login List Test', () async {
      final List<MT5Account?>? mt5LoginList = await MT5Account.fetchLoginList(
        const Mt5LoginListRequest(),
      );

      final MT5Account firstMT5Account = mt5LoginList!.first!;

      expect(mt5LoginList.length, 1);

      expect(firstMT5Account.balance, 350.0);
      expect(firstMT5Account.country, 'India');
      expect(firstMT5Account.currency, 'USD');
      expect(firstMT5Account.displayBalance, '350.0');
      expect(firstMT5Account.email, 'test@example.com');
      expect(firstMT5Account.group, 'svg_standard');
      expect(firstMT5Account.leverage, 100);
      expect(firstMT5Account.login, 'MT346525');
      expect(firstMT5Account.name, 'Jon Doe');
    });

    test('MT5 Deposit Test', () async {
      final MT5Deposit mt5Deposit = await MT5Account(login: 'MTR1000').deposit(
        amount: 1000,
        fromBinary: 'CR100001',
      );

      expect(mt5Deposit.mt5Deposit, true);
      expect(mt5Deposit.binaryTransactionId, 3487342);
    });

    test('MT5 Change Password Test', () async {
      final MT5PasswordChange result =
          await MT5Account(login: 'MTR1000').changePassword(
        newPassword: 'abcd1234',
        oldPassword: 'Abc1234',
        passwordType: PasswordType.main,
      );

      expect(result.succeeded, true);
    });

    test('MT5 Check Password Test', () async {
      final MT5PasswordCheck result =
          await MT5Account(login: 'MTR1000').checkPassword(
        password: 'abcd1234',
        passwordType: PasswordType.main,
      );

      expect(result.succeeded, true);
    });

    test('MT5 Reset Password Test', () async {
      final MT5PasswordReset result =
          await MT5Account(login: 'MTR1000').resetPassword(
        newPassword: 'abcd1234',
        passwordType: PasswordType.main,
        verificationCode: 'O8eZ2xMq',
      );

      expect(result.succeeded, true);
    });

    test('Fetch MT5 Settings Test', () async {
      final MT5Settings mt5Settings =
          await MT5Account(login: 'MTR1000').fetchSettings();

      expect(mt5Settings.address, 'sample address');
      expect(mt5Settings.balance, '250.0');
      expect(mt5Settings.city, 'London');
      expect(mt5Settings.company, 'sample company');
      expect(mt5Settings.country, 'England');
      expect(mt5Settings.currency, 'USD');
      expect(mt5Settings.email, 'test@email.com');
      expect(mt5Settings.group, 'sample_group');
      expect(mt5Settings.leverage, 20);
      expect(mt5Settings.login, 'MT23432');
      expect(mt5Settings.name, 'Jon Doe');
      expect(mt5Settings.phone, '+00134522345');
      expect(mt5Settings.phonePassword, 'dummy_password');
      expect(mt5Settings.state, 'dummy_state');
      expect(mt5Settings.zipCode, '3425367');
    });

    test('MT5 Withdrawal Test', () async {
      final MT5Withdrawal mt5Withdrawal =
          await MT5Account(login: 'MTR1000').withdraw(
        amount: 1000,
        toBinary: 'CR100001',
      );

      expect(mt5Withdrawal.mt5Withdrawal, true);
      expect(mt5Withdrawal.binaryTransactionId, 486245);
    });
  });
}
