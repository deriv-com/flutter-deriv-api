import 'package:flutter_deriv_api/api/application/models/revoke_oauth_app_model.dart';
import 'package:flutter_deriv_api/api/application/oauth_app/exceptions/oauth_app_exception.dart';
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
  factory RevokeOauthApp.fromResponse(int result) => RevokeOauthApp(
        succeeded: getBool(result),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  RevokeOauthApp copyWith({
    int succeeded,
  }) =>
      RevokeOauthApp(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Revoke oauth application
  /// For parameters information refer to [RevokeOauthAppRequest]
  static Future<RevokeOauthApp> revokeOauthApplication({
    RevokeOauthAppRequest request,
  }) async {
    final RevokeOauthAppResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw OauthAppException(message: response.error['message']);
    }

    return RevokeOauthApp.fromResponse(response.revokeOauthApp);
  }
}
