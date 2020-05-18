import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/user/verify_email.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('verify email test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final VerifyEmail verifyEmail = await VerifyEmail.verify(
      const VerifyEmailRequest(
        verifyEmail: 'test@mailinator.com',
        type: 'account_opening',
      ),
    );

    expect(verifyEmail.verified, true);
  });
}