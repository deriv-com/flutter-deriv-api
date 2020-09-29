import 'package:flutter_deriv_api/api/account/authorize/exceptions/authorize_exception.dart';
import 'package:flutter_deriv_api/api/account/models/login_history_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// A class for client login/logout activities
class LoginHistory extends LoginHistoryModel {
  /// Initializes
  LoginHistory({
    LoginAction action,
    String environment,
    bool status,
    DateTime time,
  }) : super(
          action: action,
          environment: environment,
          status: status,
          time: time,
        );

  /// Generates an instance from JSON
  factory LoginHistory.fromJson(Map<String, dynamic> json) => LoginHistory(
        action: getEnumFromString(
          values: LoginAction.values,
          name: json['action'],
        ),
        environment: json['environment'],
        status: getBool(json['status']),
        time: getDateTime(json['time']),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  LoginHistory copyWith({
    LoginAction action,
    String environment,
    bool status,
    DateTime time,
  }) =>
      LoginHistory(
        action: action ?? this.action,
        environment: environment ?? this.environment,
        status: status ?? this.status,
        time: time ?? this.time,
      );

  /// Retrieves a summary of login history for user.
  ///
  /// For parameters information refer to [LoginHistory].
  /// Throws an [AuthorizeException] if API response contains an error
  static Future<List<LoginHistory>> fetchHistory([
    LoginHistoryRequest request,
  ]) async {
    final LoginHistoryResponse response = await _api.call(
      request: request ?? const LoginHistoryRequest(limit: 10),
    );

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          AuthorizeException(code: code, message: message),
    );

    return getListFromMap(
      response.loginHistory,
      itemToTypeCallback: (dynamic item) => LoginHistory.fromJson(item),
    );
  }
}
