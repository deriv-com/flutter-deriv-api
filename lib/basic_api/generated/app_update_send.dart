/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_update_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// App update request class
class AppUpdateRequest extends Request {
  /// Initialize AppUpdateRequest
  const AppUpdateRequest({
    this.appMarkupPercentage,
    @required this.appUpdate,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    @required this.name,
    @required this.redirectUri,
    @required this.scopes,
    this.verificationUri,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'app_update',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppUpdateRequest.fromJson(Map<String, dynamic> json) =>
      AppUpdateRequest(
        appMarkupPercentage: json['app_markup_percentage'] as num,
        appUpdate: json['app_update'] as int,
        appstore: json['appstore'] as String,
        github: json['github'] as String,
        googleplay: json['googleplay'] as String,
        homepage: json['homepage'] as String,
        name: json['name'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        redirectUri: json['redirect_uri'] as String,
        reqId: json['req_id'] as int,
        scopes: (json['scopes'] as List)
            ?.map((dynamic item) => item as String)
            ?.toList(),
        verificationUri: json['verification_uri'] as String,
      );

  /// [Optional] Markup to be added to contract prices (as a percentage of contract payout).
  final num appMarkupPercentage;

  /// Application app_id.
  final int appUpdate;

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
  final List<String> scopes;

  /// [Optional] Used when `verify_email` called. If available, a URL containing the verification token will send to the client's email, otherwise only the token will be sent.
  final String verificationUri;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_markup_percentage': appMarkupPercentage,
        'app_update': appUpdate,
        'appstore': appstore,
        'github': github,
        'googleplay': googleplay,
        'homepage': homepage,
        'name': name,
        'passthrough': passthrough,
        'redirect_uri': redirectUri,
        'req_id': reqId,
        'scopes': scopes,
        'verification_uri': verificationUri,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppUpdateRequest copyWith({
    num appMarkupPercentage,
    int appUpdate,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    String name,
    String redirectUri,
    List<String> scopes,
    String verificationUri,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AppUpdateRequest(
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        appUpdate: appUpdate ?? this.appUpdate,
        appstore: appstore ?? this.appstore,
        github: github ?? this.github,
        googleplay: googleplay ?? this.googleplay,
        homepage: homepage ?? this.homepage,
        name: name ?? this.name,
        redirectUri: redirectUri ?? this.redirectUri,
        scopes: scopes ?? this.scopes,
        verificationUri: verificationUri ?? this.verificationUri,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
