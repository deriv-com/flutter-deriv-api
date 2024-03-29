import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/mt5/exceptions/mt5_exception.dart';
import 'package:flutter_deriv_api/api/mt5/models/mt5_password_check_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// MT5 password check class
class MT5PasswordCheck extends MT5PasswordCheckModel {
  /// Initializes
  MT5PasswordCheck({
    bool? succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory MT5PasswordCheck.fromResponse(Mt5PasswordCheckResponse response) =>
      MT5PasswordCheck(succeeded: getBool(response.mt5PasswordCheck));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a copy of instance with given parameters
  MT5PasswordCheck copyWith({
    bool? succeeded,
  }) =>
      MT5PasswordCheck(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Validates the main password for the MT5 user.
  ///
  /// For parameters information refer to [Mt5PasswordCheckRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<MT5PasswordCheck> checkPassword(
    Mt5PasswordCheckRequest request,
  ) async {
    final Mt5PasswordCheckResponse response =
        await _api.call<Mt5PasswordCheckResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return MT5PasswordCheck.fromResponse(response);
  }
}
