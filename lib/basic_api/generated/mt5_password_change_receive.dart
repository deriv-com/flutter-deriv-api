/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_change_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Mt5 password change response class
class Mt5PasswordChangeResponse extends Response {
  /// Initialize Mt5PasswordChangeResponse
  const Mt5PasswordChangeResponse({
    this.mt5PasswordChange,
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
  factory Mt5PasswordChangeResponse.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordChangeResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        mt5PasswordChange: json['mt5_password_change'] as int,
        reqId: json['req_id'] as int,
      );

  /// `1` on success
  final int mt5PasswordChange;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'mt5_password_change': mt5PasswordChange,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordChangeResponse copyWith({
    int mt5PasswordChange,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5PasswordChangeResponse(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
