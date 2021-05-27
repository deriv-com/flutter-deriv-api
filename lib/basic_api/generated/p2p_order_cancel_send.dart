/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_cancel_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// P2p order cancel request class
class P2pOrderCancelRequest extends Request {
  /// Initialize P2pOrderCancelRequest
  const P2pOrderCancelRequest({
    @required this.id,
    this.p2pOrderCancel = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_order_cancel',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pOrderCancelRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderCancelRequest(
        id: json['id'] as String,
        p2pOrderCancel: json['p2p_order_cancel'] == null
            ? null
            : json['p2p_order_cancel'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// The unique identifier for this order.
  final String id;

  /// Must be `true`
  final bool p2pOrderCancel;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'p2p_order_cancel': p2pOrderCancel == null
            ? null
            : p2pOrderCancel
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCancelRequest copyWith({
    String id,
    bool p2pOrderCancel,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pOrderCancelRequest(
        id: id ?? this.id,
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
