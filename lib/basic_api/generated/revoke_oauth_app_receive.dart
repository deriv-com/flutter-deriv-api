/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/revoke_oauth_app_receive.json

import '../response.dart';

/// RevokeOauthAppResponse class
class RevokeOauthAppResponse extends Response {
  /// Initialize RevokeOauthAppResponse
  const RevokeOauthAppResponse({
    this.revokeOauthApp,
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
  factory RevokeOauthAppResponse.fromJson(Map<String, dynamic> json) =>
      RevokeOauthAppResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        revokeOauthApp: json['revoke_oauth_app'] as int,
      );

  /// `1` on success
  final int revokeOauthApp;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'revoke_oauth_app': revokeOauthApp,
      };

  /// Creates a copy of instance with given parameters
  @override
  RevokeOauthAppResponse copyWith({
    int revokeOauthApp,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      RevokeOauthAppResponse(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
