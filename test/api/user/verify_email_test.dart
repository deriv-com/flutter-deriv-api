import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/verify_email_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/verify_email_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Verify Email Test', () async {
    final VerifyEmailResponse verifyEmail = await VerifyEmailResponse.verify(
      const VerifyEmailRequest(
        verifyEmail: 'test@mailinator.com',
        type: 'account_opening',
      ),
    );

    expect(verifyEmail.verifyEmail, true);
  });
}
