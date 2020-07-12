/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_real_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// New account real response class
class NewAccountRealResponse extends Response {
  /// Initialize NewAccountRealResponse
  const NewAccountRealResponse({
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
  factory NewAccountRealResponse.fromJson(Map<String, dynamic> json) =>
      NewAccountRealResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        newAccountReal: json['new_account_real'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// New real money account details
  final Map<String, dynamic> newAccountReal;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'new_account_real': newAccountReal,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountRealResponse copyWith({
    Map<String, dynamic> newAccountReal,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NewAccountRealResponse(
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
