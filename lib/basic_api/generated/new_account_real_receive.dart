/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_real_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// New account real receive class
class NewAccountRealReceive extends Response {
  /// Initialize NewAccountRealReceive
  const NewAccountRealReceive({
    this.newAccountReal,
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
  factory NewAccountRealReceive.fromJson(Map<String, dynamic> json) =>
      NewAccountRealReceive(
        newAccountReal: json['new_account_real'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// New real money account details
  final Map<String, dynamic> newAccountReal;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_account_real': newAccountReal,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountRealReceive copyWith({
    Map<String, dynamic> newAccountReal,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NewAccountRealReceive(
        newAccountReal: newAccountReal ?? this.newAccountReal,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
