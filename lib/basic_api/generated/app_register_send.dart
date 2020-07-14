/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_register_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// App register request class
class AppRegisterRequest extends Request {
  /// Initialize AppRegisterRequest
  const AppRegisterRequest({
    this.appMarkupPercentage,
    this.appRegister = true,
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
          msgType: 'app_register',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppRegisterRequest.fromJson(Map<String, dynamic> json) =>
      AppRegisterRequest(
        appMarkupPercentage: json['app_markup_percentage'] as num,
        appRegister:
            json['app_register'] == null ? null : json['app_register'] == 1,
        appstore: json['appstore'] as String,
        github: json['github'] as String,
        googleplay: json['googleplay'] as String,
        homepage: json['homepage'] as String,
        name: json['name'] as String,
        redirectUri: json['redirect_uri'] as String,
        scopes: (json['scopes'] as List<dynamic>)
            ?.map<String>((dynamic item) => item as String)
            ?.toList(),
        verificationUri: json['verification_uri'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] Markup to be added to contract prices (as a percentage of contract payout).
  final num appMarkupPercentage;

  /// Must be `true`
  final bool appRegister;

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

  /// List of permission scopes to grant the application.
  final List<String> scopes;

  /// [Optional] Used when `verify_email` called. If available, a URL containing the verification token will be sent to the client's email, otherwise only the token will be sent.
  final String verificationUri;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_markup_percentage': appMarkupPercentage,
        'app_register': appRegister == null ? null : appRegister ? 1 : 0,
        'appstore': appstore,
        'github': github,
        'googleplay': googleplay,
        'homepage': homepage,
        'name': name,
        'redirect_uri': redirectUri,
        'scopes': scopes,
        'verification_uri': verificationUri,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppRegisterRequest copyWith({
    num appMarkupPercentage,
    bool appRegister,
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
      AppRegisterRequest(
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        appRegister: appRegister ?? this.appRegister,
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
