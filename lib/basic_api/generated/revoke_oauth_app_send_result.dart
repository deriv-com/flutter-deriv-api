/// Revoke oauth app send model class
abstract class RevokeOauthAppSendModel {
  /// Initializes
  RevokeOauthAppSendModel({
    @required this.revokeOauthApp,
  });

  /// The application ID to revoke.
  final int revokeOauthApp;
}

/// Revoke oauth app send class
class RevokeOauthAppSend extends RevokeOauthAppSendModel {
  /// Initializes
  RevokeOauthAppSend({
    @required int revokeOauthApp,
  }) : super(
          revokeOauthApp: revokeOauthApp,
        );

  /// Creates an instance from JSON
  factory RevokeOauthAppSend.fromJson(Map<String, dynamic> json) =>
      RevokeOauthAppSend(
        revokeOauthApp: json['revoke_oauth_app'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['revoke_oauth_app'] = revokeOauthApp;

    return result;
  }

  /// Creates a copy of instance with given parameters
  RevokeOauthAppSend copyWith({
    int revokeOauthApp,
  }) =>
      RevokeOauthAppSend(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
      );
}
