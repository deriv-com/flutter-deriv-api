import 'package:flutter_deriv_api/api/models/revoke_oauth_app_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Revoke oauth app class
class RevokeOauthApp extends RevokeOauthAppModel {
  /// Class constructor
  RevokeOauthApp({
    bool revokeOauthApp,
  }) : super(
          revokeOauthApp: revokeOauthApp,
        );

  /// Creates instance from json
  factory RevokeOauthApp.fromJson(Map<String, dynamic> json) => RevokeOauthApp(
        revokeOauthApp: getBool(json['revoke_oauth_app']),
      );

  /// Creates copy of instance with given parameters
  RevokeOauthApp copyWith({
    int revokeOauthApp,
  }) =>
      RevokeOauthApp(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
      );
}
