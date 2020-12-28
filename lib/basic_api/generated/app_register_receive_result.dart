/// App register receive model class
abstract class AppRegisterReceiveModel {
  /// Initializes
  AppRegisterReceiveModel({
    @required this.appRegister,
  });

  /// The information of the created application.
  final AppRegister appRegister;
}

/// App register receive class
class AppRegisterReceive extends AppRegisterReceiveModel {
  /// Initializes
  AppRegisterReceive({
    @required AppRegister appRegister,
  }) : super(
          appRegister: appRegister,
        );

  /// Creates an instance from JSON
  factory AppRegisterReceive.fromJson(Map<String, dynamic> json) =>
      AppRegisterReceive(
        appRegister: json['app_register'] == null
            ? null
            : AppRegister.fromJson(json['app_register']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (appRegister != null) {
      result['app_register'] = appRegister.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppRegisterReceive copyWith({
    AppRegister appRegister,
  }) =>
      AppRegisterReceive(
        appRegister: appRegister ?? this.appRegister,
      );
}
/// App register model class
abstract class AppRegisterModel {
  /// Initializes
  AppRegisterModel({
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

  /// Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final String verificationUri;
}

/// App register class
class AppRegister extends AppRegisterModel {
  /// Initializes
  AppRegister({
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
  factory AppRegister.fromJson(Map<String, dynamic> json) => AppRegister(
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
  AppRegister copyWith({
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
      AppRegister(
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
