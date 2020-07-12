/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/oauth_apps_receive.json

import '../response.dart';

/// OauthAppsResponse class
class OauthAppsResponse extends Response {
  /// Initialize OauthAppsResponse
  const OauthAppsResponse({
    this.oauthApps,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory OauthAppsResponse.fromJson(Map<String, dynamic> json) =>
      OauthAppsResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as, always_specify_types
        oauthApps: (json['oauth_apps'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// List of OAuth applications that used for the authorized account.
  final List<Map<String, dynamic>> oauthApps;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'oauth_apps': oauthApps,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  OauthAppsResponse copyWith({
    List<Map<String, dynamic>> oauthApps,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      OauthAppsResponse(
        oauthApps: oauthApps ?? this.oauthApps,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
