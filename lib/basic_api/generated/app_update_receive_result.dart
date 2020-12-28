/// App update receive model class
abstract class AppUpdateReceiveModel {
  /// Initializes
  AppUpdateReceiveModel({
    @required this.appUpdate,
  });

  /// Information of the updated application.
  final AppUpdate appUpdate;
}

/// App update receive class
class AppUpdateReceive extends AppUpdateReceiveModel {
  /// Initializes
  AppUpdateReceive({
    @required AppUpdate appUpdate,
  }) : super(
          appUpdate: appUpdate,
        );

  /// Creates an instance from JSON
  factory AppUpdateReceive.fromJson(Map<String, dynamic> json) =>
      AppUpdateReceive(
        appUpdate: json['app_update'] == null
            ? null
            : AppUpdate.fromJson(json['app_update']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (appUpdate != null) {
      result['app_update'] = appUpdate.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppUpdateReceive copyWith({
    AppUpdate appUpdate,
  }) =>
      AppUpdateReceive(
        appUpdate: appUpdate ?? this.appUpdate,
      );
}
/// App update model class
abstract class AppUpdateModel {
  /// Initializes
  AppUpdateModel({
    @required this.appId,
    @required this.appMarkupPercentage,
    @required this.appstore,
    @required this.github,
    @required this.googleplay,
    @required this.homepage,
    @required this.name,
    @required this.redirectUri,
    @required this.verificationUri,
  });

  /// Application ID.
  final int appId;

  /// Markup added to contract prices (as a percentage of contract payout).
  final double appMarkupPercentage;

  /// Application's App Store URL.
  final String appstore;

  /// Application's GitHub page (for open-source projects).
  final String github;

  /// Application's Google Play URL.
  final String googleplay;

  /// Application's homepage URL.
  final String homepage;

  /// Application name.
  final String name;

  /// The URL to redirect to after a successful login.
  final String redirectUri;

  /// Used when `verify_email` called. If available, a URL containing the verification token will be sent to the client's email, otherwise only the token will be sent.
  final String verificationUri;
}

/// App update class
class AppUpdate extends AppUpdateModel {
  /// Initializes
  AppUpdate({
    @required int appId,
    @required double appMarkupPercentage,
    @required String appstore,
    @required String github,
    @required String googleplay,
    @required String homepage,
    @required String name,
    @required String redirectUri,
    @required String verificationUri,
  }) : super(
          appId: appId,
          appMarkupPercentage: appMarkupPercentage,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          name: name,
          redirectUri: redirectUri,
          verificationUri: verificationUri,
        );

  /// Creates an instance from JSON
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        appId: json['app_id'],
        appMarkupPercentage: getDouble(json['app_markup_percentage']),
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        name: json['name'],
        redirectUri: json['redirect_uri'],
        verificationUri: json['verification_uri'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_id'] = appId;
    result['app_markup_percentage'] = appMarkupPercentage;
    result['appstore'] = appstore;
    result['github'] = github;
    result['googleplay'] = googleplay;
    result['homepage'] = homepage;
    result['name'] = name;
    result['redirect_uri'] = redirectUri;
    result['verification_uri'] = verificationUri;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppUpdate copyWith({
    int appId,
    double appMarkupPercentage,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    String name,
    String redirectUri,
    String verificationUri,
  }) =>
      AppUpdate(
        appId: appId ?? this.appId,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        name: name ?? this.name,
        redirectUri: redirectUri ?? this.redirectUri,
        verificationUri: verificationUri ?? this.verificationUri,
      );
}
