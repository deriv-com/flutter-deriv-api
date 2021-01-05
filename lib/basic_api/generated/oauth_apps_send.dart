/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/oauth_apps_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Oauth apps send class
class OauthAppsSend extends Request {
  /// Initialize OauthAppsSend
  const OauthAppsSend({
    this.oauthApps = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'oauth_apps',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory OauthAppsSend.fromJson(Map<String, dynamic> json) => OauthAppsSend(
        oauthApps: json['oauth_apps'] == null ? null : json['oauth_apps'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool oauthApps;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'oauth_apps': oauthApps == null
            ? null
            : oauthApps
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  OauthAppsSend copyWith({
    bool oauthApps,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      OauthAppsSend(
        oauthApps: oauthApps ?? this.oauthApps,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
