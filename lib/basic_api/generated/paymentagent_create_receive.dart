/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_create_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Paymentagent create receive class.
class PaymentagentCreateReceive extends Response {
  /// Initialize PaymentagentCreateReceive.
  const PaymentagentCreateReceive({
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
  factory PaymentagentCreateReceive.fromJson(Map<String, dynamic> json) =>
      PaymentagentCreateReceive(
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
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
  PaymentagentCreateReceive copyWith({
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PaymentagentCreateReceive(
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
