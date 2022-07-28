/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_check_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Mt5 password check receive class.
class Mt5PasswordCheckReceive extends Response {
  /// Initialize Mt5PasswordCheckReceive.
  const Mt5PasswordCheckReceive({
    this.mt5PasswordCheck,
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
  factory Mt5PasswordCheckReceive.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordCheckReceive(
        mt5PasswordCheck: json['mt5_password_check'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `1` on success
  final int? mt5PasswordCheck;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_password_check': mt5PasswordCheck,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordCheckReceive copyWith({
    int? mt5PasswordCheck,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5PasswordCheckReceive(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
