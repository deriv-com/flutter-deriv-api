/// Oauth apps send model class
abstract class OauthAppsSendModel {
  /// Initializes
  OauthAppsSendModel({
    @required this.oauthApps,
  });

  /// Must be `1`
  final int oauthApps;
}

/// Oauth apps send class
class OauthAppsSend extends OauthAppsSendModel {
  /// Initializes
  OauthAppsSend({
    @required int oauthApps,
  }) : super(
          oauthApps: oauthApps,
        );

  /// Creates an instance from JSON
  factory OauthAppsSend.fromJson(Map<String, dynamic> json) => OauthAppsSend(
        oauthApps: json['oauth_apps'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['oauth_apps'] = oauthApps;

    return result;
  }

  /// Creates a copy of instance with given parameters
  OauthAppsSend copyWith({
    int oauthApps,
  }) =>
      OauthAppsSend(
        oauthApps: oauthApps ?? this.oauthApps,
      );
}
