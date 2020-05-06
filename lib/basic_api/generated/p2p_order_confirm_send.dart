/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_confirm_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_order_confirm_send.g.dart';

/// JSON conversion for 'p2p_order_confirm_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderConfirmRequest extends Request {
  /// Initialize P2pOrderConfirmRequest
  const P2pOrderConfirmRequest({
    this.id,
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
      _$P2pOrderConfirmRequestFromJson(json);

  // Properties
  /// The unique identifier for this order.
  final String id;

  /// Must be 1
  final int p2pOrderConfirm;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderConfirmRequestToJson(this);

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
