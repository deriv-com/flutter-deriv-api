/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_cancel_receive.json

import '../response.dart';

/// P2pOrderCancelResponse class
class P2pOrderCancelResponse extends Response {
  /// Initialize P2pOrderCancelResponse
  const P2pOrderCancelResponse({
    this.p2pOrderCancel,
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
  factory P2pOrderCancelResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderCancelResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        p2pOrderCancel: json['p2p_order_cancel'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Cancellation details
  final Map<String, dynamic> p2pOrderCancel;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_order_cancel': p2pOrderCancel,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCancelResponse copyWith({
    Map<String, dynamic> p2pOrderCancel,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pOrderCancelResponse(
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
