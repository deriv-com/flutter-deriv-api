/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_create_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Paymentagent create response class
class PaymentagentCreateResponse extends Response {
  /// Initialize PaymentagentCreateResponse
  const PaymentagentCreateResponse({
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
  factory PaymentagentCreateResponse.fromJson(Map<String, dynamic> json) =>
      PaymentagentCreateResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentCreateResponse copyWith({
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PaymentagentCreateResponse(
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
