import '../../basic_api/generated/verify_email_receive.dart';
import '../../basic_api/generated/verify_email_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Verify email response model class.
abstract class VerifyEmailResponseModel {
  /// Initializes Verify email response model class .
  VerifyEmailResponseModel({
    this.verifyEmail,
  });

  /// 1 for success (secure code has been sent to the email address)
  final bool? verifyEmail;
}

/// Verify email response class.
class VerifyEmailResponse extends VerifyEmailResponseModel {
  /// Initializes Verify email response class.
  VerifyEmailResponse({
    bool? verifyEmail,
  }) : super(
          verifyEmail: verifyEmail,
        );

  /// Creates an instance from JSON.
  factory VerifyEmailResponse.fromJson(
    dynamic verifyEmailJson,
  ) =>
      VerifyEmailResponse(
        verifyEmail: getBool(verifyEmailJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['verify_email'] = verifyEmail;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Verifies an email address for various purposes.
  ///
  /// The system will send an email to the address containing a security code for verification.
  /// For parameters information refer to [VerifyEmailRequest].
  /// Throws a [UserException] if API response contains an error
  static Future<VerifyEmailResponse> verify(
    VerifyEmailRequest request,
  ) async {
    final VerifyEmailReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          UserException(baseExceptionModel: baseExceptionModel),
    );

    return VerifyEmailResponse.fromJson(response.verifyEmail);
  }

  /// Creates a copy of instance with given parameters.
  VerifyEmailResponse copyWith({
    bool? verifyEmail,
  }) =>
      VerifyEmailResponse(
        verifyEmail: verifyEmail ?? this.verifyEmail,
      );
}
