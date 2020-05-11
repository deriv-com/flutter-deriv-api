import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/mt5/mt5_password_change.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_check.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_reset.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  group('mt5 password group ->', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('change password test', () async {
      final MT5PasswordChange mt5PasswordChange =
          await MT5PasswordChange.changePassword(
        request: const Mt5PasswordChangeRequest(
          mt5PasswordChange: 1,
          login: 'MTR1000',
          newPassword: 'abcd1234',
          oldPassword: 'Abc1234',
          passwordType: 'main',
        ),
      );

      expect(mt5PasswordChange.succeeded, true);
    });

    test('check password test', () async {
      final MT5PasswordCheck mt5PasswordCheck =
          await MT5PasswordCheck.checkPassword(
        request: const Mt5PasswordCheckRequest(
          mt5PasswordCheck: 1,
          login: 'MTR1000',
          password: 'abcd1234',
          passwordType: 'main',
        ),
      );

      expect(mt5PasswordCheck.succeeded, true);
    });

    test('reset password test', () async {
      final MT5PasswordReset mt5PasswordReset =
          await MT5PasswordReset.resetPassword(
        request: const Mt5PasswordResetRequest(
          mt5PasswordReset: 1,
          login: 'MTR1000',
          newPassword: 'abcd1234',
          passwordType: 'main',
          verificationCode: 'O8eZ2xMq',
        ),
      );

      expect(mt5PasswordReset.succeeded, true);
    });
  });
}
