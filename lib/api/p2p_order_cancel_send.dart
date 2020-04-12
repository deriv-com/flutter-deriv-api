/// generated automatically from flutter_deriv_api|lib/api/p2p_order_cancel_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'p2p_order_cancel_send.g.dart';

/// JSON conversion for 'p2p_order_cancel_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderCancelRequest extends Request {
  /// Initialize P2pOrderCancelRequest
  const P2pOrderCancelRequest({
    this.id,
    this.p2pOrderCancel = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory P2pOrderCancelRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderCancelRequestFromJson(json);

  // Properties
  /// The unique identifier for this order.
  final String id;

  /// Must be 1
  final int p2pOrderCancel;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderCancelRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pOrderCancelRequest copyWith({
    String id,
    int p2pOrderCancel,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      P2pOrderCancelRequest(
        id: id ?? this.id,
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
