import 'package:flutter_deriv_api/basic_api/generated/verify_email_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/verify_email_receive_result.dart';


void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Verify Email Test', () async {
    final VerifyEmailResponse verifyEmail = await VerifyEmailResponse.verify(
      const VerifyEmailSend(
        verifyEmail: 'test@mailinator.com',
        type: 'account_opening',
      ),
    );

    expect(verifyEmail.verifyEmail, true);
  });
}
