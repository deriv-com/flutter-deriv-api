/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_list_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Paymentagent list response class
class PaymentagentListResponse extends Response {
  /// Initialize PaymentagentListResponse
  const PaymentagentListResponse({
    this.paymentagentList,
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
  factory PaymentagentListResponse.fromJson(Map<String, dynamic> json) =>
      PaymentagentListResponse(
        paymentagentList: json['paymentagent_list'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Payment Agent List
  final Map<String, dynamic> paymentagentList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'paymentagent_list': paymentagentList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentListResponse copyWith({
    Map<String, dynamic> paymentagentList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PaymentagentListResponse(
        paymentagentList: paymentagentList ?? this.paymentagentList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
