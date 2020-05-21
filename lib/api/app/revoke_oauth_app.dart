import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/app/models/revoke_oauth_app_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Revoke oauth app class
class RevokeOauthApp extends RevokeOauthAppModel {
  /// Initializes
  RevokeOauthApp({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory RevokeOauthApp.fromResponse(RevokeOauthAppResponse response) =>
      RevokeOauthApp(succeeded: getBool(response.revokeOauthApp));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  RevokeOauthApp copyWith({
    int succeeded,
  }) =>
      RevokeOauthApp(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Revoke access of particular app.
  /// For parameters information refer to [RevokeOauthAppRequest].
  static Future<RevokeOauthApp> revokeOauthApplication(
    RevokeOauthAppRequest request,
  ) async {
    final RevokeOauthAppResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) => AppException(message: message),
    );

    return RevokeOauthApp.fromResponse(response);
  }
}
