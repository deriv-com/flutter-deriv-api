/// generated automatically from flutter_deriv_api|lib/basic_api/generated/app_update_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'app_update_send.g.dart';

/// JSON conversion for 'app_update_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppUpdateRequest extends Request {
  /// Initialize AppUpdateRequest
  const AppUpdateRequest({
    this.appMarkupPercentage,
    this.appUpdate = 1,
    this.appstore,
    this.github,
    this.googleplay,
    this.homepage,
    this.name,
    this.redirectUri,
    this.scopes,
    this.verificationUri,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory AppUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateRequestFromJson(json);

  // Properties
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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppUpdateRequestToJson(this);

  /// Creates copy of instance with given parameters
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
