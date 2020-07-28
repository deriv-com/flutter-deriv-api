import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/user/verify_email.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(true));

  test('Verify Email Test', () async {
    final VerifyEmail verifyEmail = await VerifyEmail.verify(
      const VerifyEmailRequest(
        verifyEmail: 'test@mailinator.com',
        type: 'account_opening',
      ),
    );

    expect(verifyEmail.verified, true);
  });
}
