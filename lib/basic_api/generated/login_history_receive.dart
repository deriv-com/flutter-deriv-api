/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/login_history_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Login history receive class.
class LoginHistoryReceive extends Response {
  /// Initialize LoginHistoryReceive.
  const LoginHistoryReceive({
    this.loginHistory,
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
  factory LoginHistoryReceive.fromJson(Map<String, dynamic> json) =>
      LoginHistoryReceive(
        loginHistory: (json['login_history'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Array of records of client login/logout activities
  final List<Map<String, dynamic>>? loginHistory;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login_history': loginHistory,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LoginHistoryReceive copyWith({
    List<Map<String, dynamic>>? loginHistory,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      LoginHistoryReceive(
        loginHistory: loginHistory ?? this.loginHistory,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
