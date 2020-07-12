/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_info_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// P2pOrderInfoRequest class
class P2pOrderInfoRequest extends Request {
  /// Initialize P2pOrderInfoRequest
  const P2pOrderInfoRequest({
    @required this.id,
    this.p2pOrderInfo = 1,
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
        // ignore: avoid_as
        id: json['id'] as String,
        // ignore: avoid_as
        p2pOrderInfo: json['p2p_order_info'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
      );

  /// The unique identifier for the order.
  final String id;

  /// Must be 1
  final int p2pOrderInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to order
  final int subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_order_info': p2pOrderInfo,
        'passthrough': passthrough,
        'req_id': reqId,
        'subscribe': subscribe,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderInfoRequest copyWith({
    String id,
    int p2pOrderInfo,
    int subscribe,
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
