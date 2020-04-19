import 'package:flutter_deriv_api/models/app_update/add_update.dart';

/// App update class
class AppUpdate extends AppUpdateModel {
  /// Class constructor
  AppUpdate({
    int appId,
    double appMarkupPercentage,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    String name,
    String redirectUri,
    String verificationUri,
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

  /// Creates instance from json
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        appId: json['app_id'],
        appMarkupPercentage: json['app_markup_percentage'],
        appstore: json['appstore'],
        github: json['github'],
        googleplay: json['googleplay'],
        homepage: json['homepage'],
        name: json['name'],
        redirectUri: json['redirect_uri'],
        verificationUri: json['verification_uri'],
      );

  /// Creates copy of instance with given parameters
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
