/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_list_receive.json

import '../response.dart';

/// P2pOrderListResponse class
class P2pOrderListResponse extends Response {
  /// Initialize P2pOrderListResponse
  const P2pOrderListResponse({
    this.p2pOrderList,
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
  factory P2pOrderListResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderListResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        p2pOrderList: json['p2p_order_list'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscription: json['subscription'] as Map<String, dynamic>,
      );

  /// List of P2P orders.
  final Map<String, dynamic> p2pOrderList;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_order_list': p2pOrderList,
        'req_id': reqId,
        'subscription': subscription,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderListResponse copyWith({
    Map<String, dynamic> p2pOrderList,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pOrderListResponse(
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
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
