/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_check_receive.json

import '../response.dart';

/// Mt5PasswordCheckResponse class
class Mt5PasswordCheckResponse extends Response {
  /// Initialize Mt5PasswordCheckResponse
  const Mt5PasswordCheckResponse({
    this.mt5PasswordCheck,
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
  factory Mt5PasswordCheckResponse.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordCheckResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        mt5PasswordCheck: json['mt5_password_check'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// `1` on success
  final int mt5PasswordCheck;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'mt5_password_check': mt5PasswordCheck,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordCheckResponse copyWith({
    int mt5PasswordCheck,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5PasswordCheckResponse(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
