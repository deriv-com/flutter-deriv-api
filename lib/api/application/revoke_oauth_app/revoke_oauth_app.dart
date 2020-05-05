import 'package:flutter_deriv_api/api/application/models/revoke_oauth_app_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Revoke oauth app class
class RevokeOauthApp extends RevokeOauthAppModel {
  /// Initializes
  RevokeOauthApp({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Generates an instance from json
  factory RevokeOauthApp.fromJson(Map<String, dynamic> json) => RevokeOauthApp(
        succeeded: getBool(json['revoke_oauth_app']),
      );

  /// Creates copy of instance with given parameters
  RevokeOauthApp copyWith({
    int succeeded,
  }) =>
      RevokeOauthApp(
        succeeded: succeeded ?? this.succeeded,
      );
}
