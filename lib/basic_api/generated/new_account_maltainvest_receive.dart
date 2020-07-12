/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_maltainvest_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// NewAccountMaltainvestResponse class
class NewAccountMaltainvestResponse extends Response {
  /// Initialize NewAccountMaltainvestResponse
  const NewAccountMaltainvestResponse({
    this.newAccountMaltainvest,
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
  factory NewAccountMaltainvestResponse.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvestResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        newAccountMaltainvest:
            json['new_account_maltainvest'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// New `maltainvest` account details
  final Map<String, dynamic> newAccountMaltainvest;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'new_account_maltainvest': newAccountMaltainvest,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountMaltainvestResponse copyWith({
    Map<String, dynamic> newAccountMaltainvest,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
