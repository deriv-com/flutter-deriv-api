/// App list receive model class
abstract class AppListReceiveModel {
  /// Initializes
  AppListReceiveModel({
    @required this.appList,
  });

  /// List of created applications for the authorized account.
  final List<AppList> appList;
}

/// App list receive class
class AppListReceive extends AppListReceiveModel {
  /// Initializes
  AppListReceive({
    @required List<AppList> appList,
  }) : super(
          appList: appList,
        );

  /// Creates an instance from JSON
  factory AppListReceive.fromJson(Map<String, dynamic> json) => AppListReceive(
        appList: json['app_list'] == null
            ? null
            : json['app_list']
                .map<AppList>((dynamic item) => AppList.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (appList != null) {
      result['app_list'] = appList.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppListReceive copyWith({
    List<AppList> appList,
  }) =>
      AppListReceive(
        appList: appList ?? this.appList,
      );
}
/// App list model class
abstract class AppListModel {
  /// Initializes
  AppListModel({
    @required this.appId,
    @required this.appMarkupPercentage,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    @required this.name,
    @required this.redirectUri,
    this.verificationUri,
  });

  /// Application ID.
  final int appId;

  /// Markup added to contract prices (as a percentage of contract payout).
  final double appMarkupPercentage;

  /// Application's App Store URL.
  final UNKNOWN_TYPE appstore;

  /// Application's GitHub page. (for open-source projects)
  final UNKNOWN_TYPE github;

  /// Application's Google Play URL.
  final UNKNOWN_TYPE googleplay;

  /// Application's homepage URL.
  final UNKNOWN_TYPE homepage;

  /// Application name.
  final String name;

  /// The URL to redirect to after a successful login.
  final String redirectUri;

  /// Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final UNKNOWN_TYPE verificationUri;
}

/// App list class
class AppList extends AppListModel {
  /// Initializes
  AppList({
    @required int appId,
    @required double appMarkupPercentage,
    UNKNOWN_TYPE appstore,
    UNKNOWN_TYPE github,
    UNKNOWN_TYPE googleplay,
    UNKNOWN_TYPE homepage,
    @required String name,
    @required String redirectUri,
    UNKNOWN_TYPE verificationUri,
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
  factory AppList.fromJson(Map<String, dynamic> json) => AppList(
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
  AppList copyWith({
    int appId,
    double appMarkupPercentage,
    UNKNOWN_TYPE appstore,
    UNKNOWN_TYPE github,
    UNKNOWN_TYPE googleplay,
    UNKNOWN_TYPE homepage,
    String name,
    String redirectUri,
    UNKNOWN_TYPE verificationUri,
  }) =>
      AppList(
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
