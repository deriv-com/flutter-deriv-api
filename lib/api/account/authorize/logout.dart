import 'package:flutter_deriv_api/api/account/authorize/exceptions/authorize_exception.dart';
import 'package:flutter_deriv_api/api/account/models/logout_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Logout class
class Logout extends LogoutModel {
  /// Initializes
  Logout({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Generate an instance from response
  factory Logout.fromResponse(int result) => Logout(
        succeeded: getBool(result),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  Logout copyWith({
    bool succeeded,
  }) =>
      Logout(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Logouts the session.
  /// For parameters information refer to [LogoutRequest].
  static Future<Logout> logout([
    LogoutRequest request,
  ]) async {
    final LogoutResponse response = await _api.call(
      request: request ?? const LogoutRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) => AuthorizeException(
        message: message,
      ),
    );

    return Logout.fromResponse(response.logout);
  }
}
