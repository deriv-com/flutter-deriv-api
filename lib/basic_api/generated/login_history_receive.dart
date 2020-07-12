/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/login_history_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Login history response class
class LoginHistoryResponse extends Response {
  /// Initialize LoginHistoryResponse
  const LoginHistoryResponse({
    this.loginHistory,
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
  factory LoginHistoryResponse.fromJson(Map<String, dynamic> json) =>
      LoginHistoryResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        loginHistory: (json['login_history'] as List)
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Array of records of client login/logout activities
  final List<Map<String, dynamic>> loginHistory;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'login_history': loginHistory,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LoginHistoryResponse copyWith({
    List<Map<String, dynamic>> loginHistory,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      LoginHistoryResponse(
        loginHistory: loginHistory ?? this.loginHistory,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
