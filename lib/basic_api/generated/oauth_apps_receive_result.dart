/// Oauth apps receive model class
abstract class OauthAppsReceiveModel {
  /// Initializes
  OauthAppsReceiveModel({
    @required this.oauthApps,
  });

  /// List of OAuth applications that used for the authorized account.
  final List<OauthApp> oauthApps;
}

/// Oauth apps receive class
class OauthAppsReceive extends OauthAppsReceiveModel {
  /// Initializes
  OauthAppsReceive({
    @required List<OauthApp> oauthApps,
  }) : super(
          oauthApps: oauthApps,
        );

  /// Creates an instance from JSON
  factory OauthAppsReceive.fromJson(Map<String, dynamic> json) =>
      OauthAppsReceive(
        oauthApps: json['oauth_apps'] == null
            ? null
            : json['oauth_apps']
                .map<OauthApp>((dynamic item) => OauthApp.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (oauthApps != null) {
      result['oauth_apps'] = oauthApps.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  OauthAppsReceive copyWith({
    List<OauthApp> oauthApps,
  }) =>
      OauthAppsReceive(
        oauthApps: oauthApps ?? this.oauthApps,
      );
}
/// Oauth app model class
abstract class OauthAppModel {
  /// Initializes
  OauthAppModel({
    @required this.appId,
    @required this.appMarkupPercentage,
    this.lastUsed,
    @required this.name,
    @required this.scopes,
  });

  /// Application ID.
  final int appId;

  /// Markup added to contract prices (as a percentage of contract payout)
  final double appMarkupPercentage;

  /// The last date which the application has been used.
  final UNKNOWN_TYPE lastUsed;

  /// Application name
  final String name;

  /// The list of permission scopes grant for each app.
  final List<String> scopes;
}

/// Oauth app class
class OauthApp extends OauthAppModel {
  /// Initializes
  OauthApp({
    @required int appId,
    @required double appMarkupPercentage,
    UNKNOWN_TYPE lastUsed,
    @required String name,
    @required List<String> scopes,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          lastUsed: lastUsed,
          name: name,
          scopes: scopes,
        );

  /// Creates an instance from JSON
  factory OauthApp.fromJson(Map<String, dynamic> json) => OauthApp(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage']),
        lastUsed: json['last_used'],
        name: json['name'],
        scopes: List<String>.from(json['scopes'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_id'] = appId;
    result['app_markup_percentage'] = appMarkupPercentage;
    result['last_used'] = lastUsed;
    result['name'] = name;
    result['scopes'] = scopes;

    return result;
  }

  /// Creates a copy of instance with given parameters
  OauthApp copyWith({
    int appId,
    double appMarkupPercentage,
    UNKNOWN_TYPE lastUsed,
    String name,
    List<String> scopes,
  }) =>
      OauthApp(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        scopes: scopes ?? this.scopes,
      );
}
