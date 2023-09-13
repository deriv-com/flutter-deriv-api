/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_dispute_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p order dispute receive class.
class P2pOrderDisputeReceive extends Response {
  /// Initialize P2pOrderDisputeReceive.
  const P2pOrderDisputeReceive({
    this.p2pOrderDispute,
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
  factory P2pOrderDisputeReceive.fromJson(Map<String, dynamic> json) =>
      P2pOrderDisputeReceive(
        p2pOrderDispute: json['p2p_order_dispute'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Details of the disputed order.
  final Map<String, dynamic>? p2pOrderDispute;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_order_dispute': p2pOrderDispute,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderDisputeReceive copyWith({
    Map<String, dynamic>? p2pOrderDispute,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pOrderDisputeReceive(
        p2pOrderDispute: p2pOrderDispute ?? this.p2pOrderDispute,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
