/// App update send model class
abstract class AppUpdateSendModel {
  /// Initializes
  AppUpdateSendModel({
    @required this.appUpdate,
    this.appMarkupPercentage,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    @required this.name,
    @required this.redirectUri,
    @required this.scopes,
    this.verificationUri,
  });

  /// Application app_id.
  final int appUpdate;

  /// [Optional] Markup to be added to contract prices (as a percentage of contract payout).
  final double appMarkupPercentage;

  /// [Optional] Application's App Store URL (if applicable).
  final String appstore;

  /// [Optional] Application's GitHub page (for open-source projects).
  final String github;

  /// [Optional] Application's Google Play URL (if applicable).
  final String googleplay;

  /// [Optional] Application's homepage URL.
  final String homepage;

  /// Application name.
  final String name;

  /// The URL to redirect to after a successful login.
  final String redirectUri;

  /// Change scopes will revoke all user's grants and log them out.
  final List<ScopesEnum> scopes;

  /// [Optional] Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final String verificationUri;
}

/// App update send class
class AppUpdateSend extends AppUpdateSendModel {
  /// Initializes
  AppUpdateSend({
    @required int appUpdate,
    double appMarkupPercentage,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    @required String name,
    @required String redirectUri,
    @required List<ScopesEnum> scopes,
    String verificationUri,
  }) : super(
          appUpdate: appUpdate,
          appMarkupPercentage: appMarkupPercentage,
          appstore: appstore,
          github: github,
          googleplay: googleplay,
          homepage: homepage,
          name: name,
          redirectUri: redirectUri,
          scopes: scopes,
          verificationUri: verificationUri,
        );

  /// Creates an instance from JSON
  factory AppUpdateSend.fromJson(Map<String, dynamic> json) => AppUpdateSend(
        appUpdate: json['app_update'],
        appMarkupPercentage: getDouble(json['app_markup_percentage']),
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        name: json['name'],
        redirectUri: json['redirect_uri'],
        scopes: List<ScopesEnum>.from(json['scopes'].map((x) => scopesEnumMapper
            .entries
            .firstWhere((entry) => entry.value == x, orElse: () => null)
            ?.key)),
        verificationUri: json['verification_uri'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_update'] = appUpdate;
    result['app_markup_percentage'] = appMarkupPercentage;
    result['appstore'] = appstore;
    result['github'] = github;
    result['googleplay'] = googleplay;
    result['homepage'] = homepage;
    result['name'] = name;
    result['redirect_uri'] = redirectUri;
    if (scopes != null) {
      result['scopes'] = scopes.map((item) => scopesEnumMapper[item]).toList();
    }
    result['verification_uri'] = verificationUri;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppUpdateSend copyWith({
    int appUpdate,
    double appMarkupPercentage,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    String name,
    String redirectUri,
    List<ScopesEnum> scopes,
    String verificationUri,
  }) =>
      AppUpdateSend(
        appUpdate: appUpdate ?? this.appUpdate,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        name: name ?? this.name,
        redirectUri: redirectUri ?? this.redirectUri,
        scopes: scopes ?? this.scopes,
        verificationUri: verificationUri ?? this.verificationUri,
      );
  // Creating Enum Mappers

  static final Map<ScopesEnum, String> scopesEnumMapper = {
    ScopesEnum.read: 'read',
    ScopesEnum.trade: 'trade',
    ScopesEnum.trading_information: 'trading_information',
    ScopesEnum.payments: 'payments',
    ScopesEnum.admin: 'admin',
  };
}

// Creating Enums

enum ScopesEnum {
  read,
  trade,
  trading_information,
  payments,
  admin,
}
