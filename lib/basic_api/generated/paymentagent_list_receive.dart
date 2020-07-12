/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_list_receive.json

import '../response.dart';

/// PaymentagentListResponse class
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
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        paymentagentList: json['paymentagent_list'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Payment Agent List
  final Map<String, dynamic> paymentagentList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'paymentagent_list': paymentagentList,
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
