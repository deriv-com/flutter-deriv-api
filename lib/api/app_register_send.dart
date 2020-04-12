/// generated automatically from flutter_deriv_api|lib/api/app_register_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'app_register_send.g.dart';

/// JSON conversion for 'app_register_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppRegisterRequest extends Request {
  /// Initialize AppRegisterRequest
  const AppRegisterRequest({
    this.appMarkupPercentage,
    this.appRegister = 1,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    this.name,
    this.redirectUri,
    this.scopes,
    this.verificationUri,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory AppRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$AppRegisterRequestFromJson(json);

  // Properties
  /// [Optional] Markup to be added to contract prices (as a percentage of contract payout).
  final num appMarkupPercentage;

  /// Must be `1`
  final int appRegister;

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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppRegisterRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppRegisterRequest copyWith({
    num appMarkupPercentage,
    int appRegister,
    String appstore,
    String github,
    String googleplay,
    String homepage,
    String name,
    String redirectUri,
    List<String> scopes,
    String verificationUri,
    int reqId,
    Map<String, dynamic> passthrough,
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
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
