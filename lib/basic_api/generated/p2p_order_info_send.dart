/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_info_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// P2p order info request class
class P2pOrderInfoRequest extends Request {
  /// Initialize P2pOrderInfoRequest
  const P2pOrderInfoRequest({
    @required this.id,
    this.p2pOrderInfo = true,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_order_info',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pOrderInfoRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderInfoRequest(
        id: json['id'] as String,
        p2pOrderInfo:
            json['p2p_order_info'] == null ? null : json['p2p_order_info'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// The unique identifier for the order.
  final String id;

  /// Must be `true`
  final bool p2pOrderInfo;

  /// [Optional] If set to `true`, will send updates whenever there is an update to order
  final bool subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_order_info': p2pOrderInfo == null
            ? null
            : p2pOrderInfo
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderInfoRequest copyWith({
    String id,
    bool p2pOrderInfo,
    bool subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pOrderInfoRequest(
        id: id ?? this.id,
        p2pOrderInfo: p2pOrderInfo ?? this.p2pOrderInfo,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[id];
}
