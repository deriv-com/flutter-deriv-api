/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/logout_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Logout response class
class LogoutResponse extends Response {
  /// Initialize LogoutResponse
  const LogoutResponse({
    this.logout,
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

  /// Creates an instance from JSON
  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
        logout: json['logout'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The result of logout request which is 1
  final int? logout;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'logout': logout,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LogoutResponse copyWith({
    int? logout,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      LogoutResponse(
        logout: logout ?? this.logout,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
