import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/mt5/exceptions/mt5_exception.dart';
import 'package:flutter_deriv_api/api/mt5/models/mt5_password_reset_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// MT5 password reset class
class MT5PasswordReset extends MT5PasswordResetModel {
  /// Initializes
  MT5PasswordReset({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory MT5PasswordReset.fromResponse(Mt5PasswordResetResponse response) =>
      MT5PasswordReset(succeeded: getBool(response.mt5PasswordReset));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  MT5PasswordReset copyWith({
    bool succeeded,
  }) =>
      MT5PasswordReset(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Resets the password of MT5 account.
  ///
  /// For parameters information refer to [Mt5PasswordResetRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<MT5PasswordReset> resetPassword(
    Mt5PasswordResetRequest request,
  ) async {
    final Mt5PasswordResetResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return MT5PasswordReset.fromResponse(response);
  }
}
