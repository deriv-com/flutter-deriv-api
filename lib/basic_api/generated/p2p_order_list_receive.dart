/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p order list response class.
class P2pOrderListResponse extends Response {
  /// Initialize P2pOrderListResponse.
  const P2pOrderListResponse({
    this.p2pOrderList,
    this.subscription,
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
  factory P2pOrderListResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderListResponse(
        p2pOrderList: json['p2p_order_list'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of P2P orders.
  final Map<String, dynamic>? p2pOrderList;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_order_list': p2pOrderList,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderListResponse copyWith({
    Map<String, dynamic>? p2pOrderList,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pOrderListResponse(
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
