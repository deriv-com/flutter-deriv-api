/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_info_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// P2p order info response class
class P2pOrderInfoResponse extends Response {
  /// Initialize P2pOrderInfoResponse
  const P2pOrderInfoResponse({
    this.p2pOrderInfo,
    this.subscription,
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
  factory P2pOrderInfoResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: json['p2p_order_info'] as Map<String, dynamic>,
        subscription: json['subscription'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// The information of P2P order.
  final Map<String, dynamic> p2pOrderInfo;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_order_info': p2pOrderInfo,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderInfoResponse copyWith({
    Map<String, dynamic> p2pOrderInfo,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: p2pOrderInfo ?? this.p2pOrderInfo,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
