import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/user/exceptions/user_exception.dart';
import 'package:flutter_deriv_api/api/user/models/verify_email_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Verify email
class VerifyEmail extends VerifyEmailModel {
  /// Initializes
  VerifyEmail({
    bool? verified,
  }) : super(verified: verified);

  /// Generates an instance from response
  factory VerifyEmail.fromResponse(VerifyEmailResponse response) =>
      VerifyEmail(verified: response.verifyEmail);

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a copy with given parameters
  VerifyEmail copyWith({
    bool? verified,
  }) =>
      VerifyEmail(
        verified: verified ?? this.verified,
      );

  /// Verifies an email address for various purposes.
  ///
  /// The system will send an email to the address containing a security code for verification.
  /// For parameters information refer to [VerifyEmailRequest].
  /// Throws a [UserException] if API response contains an error
  static Future<VerifyEmail> verify(
    VerifyEmailRequest request,
  ) async {
    final VerifyEmailResponse? response =
        await _api.call<VerifyEmailResponse>(request: request);

    // helper =>  final VerifyEmailResponse resposne = getResponse<VerifyEmailResponse>(response);
    // check if "is VerifyEmailResponse".
    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          UserException(baseExceptionModel: baseExceptionModel),
    );

    return VerifyEmail.fromResponse(response!);
  }
}
