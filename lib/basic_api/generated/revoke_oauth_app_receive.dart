/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/revoke_oauth_app_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Revoke oauth app receive class.
class RevokeOauthAppReceive extends Response {
  /// Initialize RevokeOauthAppReceive.
  const RevokeOauthAppReceive({
    this.revokeOauthApp,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory RevokeOauthAppReceive.fromJson(Map<String, dynamic> json) =>
      RevokeOauthAppReceive(
        revokeOauthApp: json['revoke_oauth_app'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `1` on success
  final int? revokeOauthApp;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'revoke_oauth_app': revokeOauthApp,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RevokeOauthAppReceive copyWith({
    int? revokeOauthApp,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      RevokeOauthAppReceive(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
