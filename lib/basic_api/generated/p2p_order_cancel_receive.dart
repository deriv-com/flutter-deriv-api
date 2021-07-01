/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_cancel_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p order cancel response class.
class P2pOrderCancelResponse extends Response {
  /// Initialize P2pOrderCancelResponse.
  const P2pOrderCancelResponse({
    this.p2pOrderCancel,
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
  factory P2pOrderCancelResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderCancelResponse(
        p2pOrderCancel: json['p2p_order_cancel'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Cancellation details
  final Map<String, dynamic>? p2pOrderCancel;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_order_cancel': p2pOrderCancel,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCancelResponse copyWith({
    Map<String, dynamic>? p2pOrderCancel,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pOrderCancelResponse(
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
