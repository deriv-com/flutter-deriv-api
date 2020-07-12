/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_confirm_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// P2pOrderConfirmRequest class
class P2pOrderConfirmRequest extends Request {
  /// Initialize P2pOrderConfirmRequest
  const P2pOrderConfirmRequest({
    @required this.id,
    this.p2pOrderConfirm = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_order_confirm',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pOrderConfirmRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirmRequest(
        // ignore: avoid_as
        id: json['id'] as String,
        // ignore: avoid_as
        p2pOrderConfirm: json['p2p_order_confirm'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// The unique identifier for this order.
  final String id;

  /// Must be 1
  final int p2pOrderConfirm;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_order_confirm': p2pOrderConfirm,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderConfirmRequest copyWith({
    String id,
    int p2pOrderConfirm,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pOrderConfirmRequest(
        id: id ?? this.id,
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
