// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_reset_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_reset_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Mt5 password reset response model class.
abstract class Mt5PasswordResetResponseModel {
  /// Initializes Mt5 password reset response model class .
  const Mt5PasswordResetResponseModel({
    this.mt5PasswordReset,
  });

  /// `1` on success
  final int? mt5PasswordReset;
}

/// Mt5 password reset response class.
class Mt5PasswordResetResponse extends Mt5PasswordResetResponseModel {
  /// Initializes Mt5 password reset response class.
  const Mt5PasswordResetResponse({
    int? mt5PasswordReset,
  }) : super(
          mt5PasswordReset: mt5PasswordReset,
        );

  /// Creates an instance from JSON.
  factory Mt5PasswordResetResponse.fromJson(
    dynamic mt5PasswordResetJson,
  ) =>
      Mt5PasswordResetResponse(
        mt5PasswordReset: mt5PasswordResetJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_password_reset'] = mt5PasswordReset;

    return resultMap;
  }

  static final BaseAPI _api = Injector().get<BaseAPI>()!;

  /// Resets the password of MT5 account.
  ///
  /// For parameters information refer to [Mt5PasswordResetRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5PasswordResetResponse> resetPassword(
    Mt5PasswordResetRequest request,
  ) async {
    final Mt5PasswordResetReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5PasswordResetResponse.fromJson(response.mt5PasswordReset);
  }

  /// Creates a copy of instance with given parameters.
  Mt5PasswordResetResponse copyWith({
    int? mt5PasswordReset,
  }) =>
      Mt5PasswordResetResponse(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
      );
}
