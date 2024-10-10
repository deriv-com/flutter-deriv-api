import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/identity_verification_document_add_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/identity_verification_document_add_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/identity_verification_document_add_send.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended model for [IdentityVerificationDocumentAddResponse] to add API calls.
class IdentityVerificationDocumentAddResponseExtended
    extends IdentityVerificationDocumentAddResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Adds an identity verification document.
  static Future<IdentityVerificationDocumentAddResponse>
      addIdentityVerificationDocument(
    IdentityVerificationDocumentAddRequest request,
  ) async {
    final IdentityVerificationDocumentAddReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({
        BaseExceptionModel? baseExceptionModel,
      }) =>
          BaseAPIException(
        baseExceptionModel: baseExceptionModel,
      ),
    );

    return IdentityVerificationDocumentAddResponse.fromJson(
        response.identityVerificationDocumentAdd);
  }
}
