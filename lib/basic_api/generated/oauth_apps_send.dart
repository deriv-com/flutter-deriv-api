/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/oauth_apps_send.json

import '../request.dart';

/// OauthAppsRequest class
class OauthAppsRequest extends Request {
  /// Initialize OauthAppsRequest
  const OauthAppsRequest({
    this.oauthApps = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'oauth_apps',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory OauthAppsRequest.fromJson(Map<String, dynamic> json) =>
      OauthAppsRequest(
        // ignore: avoid_as
        oauthApps: json['oauth_apps'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int oauthApps;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'oauth_apps': oauthApps,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  OauthAppsRequest copyWith({
    int oauthApps,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      OauthAppsRequest(
        oauthApps: oauthApps ?? this.oauthApps,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
