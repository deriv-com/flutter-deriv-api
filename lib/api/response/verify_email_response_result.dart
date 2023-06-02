// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/verify_email_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/verify_email_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Verify email response model class.
abstract class VerifyEmailResponseModel {
  /// Initializes Verify email response model class .
  const VerifyEmailResponseModel({
    this.verifyEmail,
  });

  /// 1 for success (secure code has been sent to the email address)
  final bool? verifyEmail;
}

/// Verify email response class.
class VerifyEmailResponse extends VerifyEmailResponseModel {
  /// Initializes Verify email response class.
  const VerifyEmailResponse({
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

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Verifies an email address for various purposes.
  ///
  /// The system will send an email to the address containing a security code for verification.
  /// For parameters information refer to [VerifyEmailRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<VerifyEmailResponse> verify(
    VerifyEmailRequest request,
  ) async {
    final VerifyEmailReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
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
