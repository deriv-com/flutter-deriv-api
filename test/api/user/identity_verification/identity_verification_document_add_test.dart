import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/identity_verification_document_add_response_extended.dart';
import 'package:flutter_deriv_api/api/response/identity_verification_document_add_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/identity_verification_document_add_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Add Identity Verification Document', () async {
    final IdentityVerificationDocumentAddResponse? identityDocumentResponse =
        await IdentityVerificationDocumentAddResponseExtended
            .addIdentityVerificationDocument(
      const IdentityVerificationDocumentAddRequest(
        documentNumber: '123',
        documentType: 'test',
        issuingCountry: 'US',
      ),
    );

    expect(identityDocumentResponse?.identityVerificationDocumentAdd, 1);
  });
}
