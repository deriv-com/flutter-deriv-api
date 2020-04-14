/// generated automatically from flutter_deriv_api|lib/api/p2p_order_info_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'p2p_order_info_send.g.dart';

/// JSON conversion for 'p2p_order_info_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderInfoRequest extends Request {
  /// Initialize P2pOrderInfoRequest
  const P2pOrderInfoRequest({
    this.id,
    this.p2pOrderInfo = 1,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pOrderInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderInfoRequestFromJson(json);

  // Properties
  /// The unique identifier for the order.
  final String id;

  /// Must be 1
  final int p2pOrderInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to order
  final int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderInfoRequestToJson(this);

  /// Creates copy of instance with given parameters
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
