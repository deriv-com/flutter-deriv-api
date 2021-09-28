import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/mt5_deposit_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_get_settings_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_login_list_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_new_account_response_result.dart'
    as new_account;
import 'package:flutter_deriv_api/api/response/mt5_password_change_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_password_check_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_password_reset_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_withdrawal_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_login_list_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_new_account_send.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('MT5 Account Group ->', () {
    test('Create New MT5 Account Test', () async {
      final new_account.Mt5NewAccountResponse mt5Account =
          await new_account.Mt5NewAccountResponse.createNewAccount(
        const Mt5NewAccountRequest(
          accountType: 'demo',
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

      expect(mt5Account.mt5NewAccount?.accountType,
          new_account.AccountTypeEnum.demo);
      expect(mt5Account.mt5NewAccount?.balance, 350.0);
      expect(mt5Account.mt5NewAccount?.currency, 'USD');
      expect(mt5Account.mt5NewAccount?.displayBalance, '350.0');
      expect(mt5Account.mt5NewAccount?.login, 'MT346525');
      expect(mt5Account.mt5NewAccount?.mt5AccountType,
          new_account.Mt5AccountTypeEnum.financial);
    });

    test('MT5 Login List Test', () async {
      final Mt5LoginListResponse mt5LoginList =
          await Mt5LoginListResponse.fetchLoginList(
        const Mt5LoginListRequest(),
      );

      expect(mt5LoginList.mt5LoginList?.length, 1);

      expect(mt5LoginList.mt5LoginList?.first.balance, 350.0);
      expect(mt5LoginList.mt5LoginList?.first.country, 'India');
      expect(mt5LoginList.mt5LoginList?.first.currency, 'USD');
      expect(mt5LoginList.mt5LoginList?.first.displayBalance, '350.0');
      expect(mt5LoginList.mt5LoginList?.first.email, 'test@example.com');
      expect(mt5LoginList.mt5LoginList?.first.group, 'svg_standard');
      expect(mt5LoginList.mt5LoginList?.first.leverage, 100);
      expect(mt5LoginList.mt5LoginList?.first.login, 'MT346525');
      expect(mt5LoginList.mt5LoginList?.first.name, 'Jon Doe');
    });

    test('MT5 Deposit Test', () async {
      // ignore: missing_required_param
      final Mt5DepositResponse mt5Deposit =
          await new_account.Mt5NewAccountResponse(
        mt5NewAccount: new_account.Mt5NewAccount(login: 'MTR1000'),
      ).deposit(
        amount: 1000,
        fromBinary: 'CR100001',
      );

      expect(mt5Deposit.mt5Deposit, 1);
      expect(mt5Deposit.binaryTransactionId, 3487342);
    });

    test('MT5 Change Password Test', () async {
      final Mt5PasswordChangeResponse result =
          await new_account.Mt5NewAccountResponse(
        mt5NewAccount: new_account.Mt5NewAccount(login: 'MTR1000'),
      ).changePassword(
        newPassword: 'abcd1234',
        oldPassword: 'Abc1234',
        passwordType: PasswordType.main,
      );

      expect(result.mt5PasswordChange, 1);
    });

    test('MT5 Check Password Test', () async {
      final Mt5PasswordCheckResponse result =
          await new_account.Mt5NewAccountResponse(
        mt5NewAccount: new_account.Mt5NewAccount(login: 'MTR1000'),
      ).checkPassword(
        password: 'abcd1234',
        passwordType: PasswordType.main,
      );

      expect(result.mt5PasswordCheck, 1);
    });

    test('MT5 Reset Password Test', () async {
      final Mt5PasswordResetResponse result =
          await new_account.Mt5NewAccountResponse(
        mt5NewAccount: new_account.Mt5NewAccount(login: 'MTR1000'),
      ).resetPassword(
        newPassword: 'abcd1234',
        passwordType: PasswordType.main,
        verificationCode: 'O8eZ2xMq',
      );

      expect(result.mt5PasswordReset, 1);
    });

    test('Fetch MT5 Settings Test', () async {
      final Mt5GetSettingsResponse mt5Settings =
          await new_account.Mt5NewAccountResponse(
        mt5NewAccount: new_account.Mt5NewAccount(login: 'MTR1000'),
      ).fetchSettings();

      expect(mt5Settings.mt5GetSettings?.address, 'sample address');
      expect(mt5Settings.mt5GetSettings?.balance, '250.0');
      expect(mt5Settings.mt5GetSettings?.city, 'London');
      expect(mt5Settings.mt5GetSettings?.company, 'sample company');
      expect(mt5Settings.mt5GetSettings?.country, 'England');
      expect(mt5Settings.mt5GetSettings?.currency, 'USD');
      expect(mt5Settings.mt5GetSettings?.email, 'test@email.com');
      expect(mt5Settings.mt5GetSettings?.group, 'sample_group');
      expect(mt5Settings.mt5GetSettings?.leverage, 20);
      expect(mt5Settings.mt5GetSettings?.login, 'MT23432');
      expect(mt5Settings.mt5GetSettings?.name, 'Jon Doe');
      expect(mt5Settings.mt5GetSettings?.phone, '+00134522345');
      expect(mt5Settings.mt5GetSettings?.phonePassword, 'dummy_password');
      expect(mt5Settings.mt5GetSettings?.state, 'dummy_state');
      expect(mt5Settings.mt5GetSettings?.zipCode, '3425367');
    });

    test('MT5 Withdrawal Test', () async {
      final Mt5WithdrawalResponse mt5Withdrawal =
          await new_account.Mt5NewAccountResponse(
        mt5NewAccount: new_account.Mt5NewAccount(login: 'MTR1000'),
      ).withdraw(
        amount: 1000,
        toBinary: 'CR100001',
      );

      expect(mt5Withdrawal.mt5Withdrawal, 1);
      expect(mt5Withdrawal.binaryTransactionId, 486245);
    });
  });
}
