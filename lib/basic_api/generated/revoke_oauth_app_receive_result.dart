/// Revoke oauth app receive model class
abstract class RevokeOauthAppReceiveModel {
  /// Initializes
  RevokeOauthAppReceiveModel({
    @required this.revokeOauthApp,
  });

  /// `1` on success
  final int revokeOauthApp;
}

/// Revoke oauth app receive class
class RevokeOauthAppReceive extends RevokeOauthAppReceiveModel {
  /// Initializes
  RevokeOauthAppReceive({
    @required int revokeOauthApp,
  }) : super(
          revokeOauthApp: revokeOauthApp,
        );

  /// Creates an instance from JSON
  factory RevokeOauthAppReceive.fromJson(Map<String, dynamic> json) =>
      RevokeOauthAppReceive(
        revokeOauthApp: json['revoke_oauth_app'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['revoke_oauth_app'] = revokeOauthApp;

    return result;
  }

  /// Creates a copy of instance with given parameters
  RevokeOauthAppReceive copyWith({
    int revokeOauthApp,
  }) =>
      RevokeOauthAppReceive(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
      );
}
