/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_new_account_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Mt5 new account response class
class Mt5NewAccountResponse extends Response {
  /// Initialize Mt5NewAccountResponse
  const Mt5NewAccountResponse({
    this.mt5NewAccount,
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
  factory Mt5NewAccountResponse.fromJson(Map<String, dynamic> json) =>
      Mt5NewAccountResponse(
        mt5NewAccount: json['mt5_new_account'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// New MT5 account details
  final Map<String, dynamic>? mt5NewAccount;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_new_account': mt5NewAccount,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5NewAccountResponse copyWith({
    Map<String, dynamic>? mt5NewAccount,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5NewAccountResponse(
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
