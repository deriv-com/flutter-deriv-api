/// Autogenerated from flutter_deriv_api|lib/api/p2p_order_info_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'p2p_order_info_send.g.dart';

/// JSON conversion for 'p2p_order_info_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderInfoRequest extends Request {
  /// Initialize P2pOrderInfoRequest
  P2pOrderInfoRequest({
    this.id,
    this.p2pOrderInfo = 1,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_order_info',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pOrderInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderInfoRequestFromJson(json);

  // Properties
  /// The unique identifier for the order.
  String id;

  /// Must be 1
  int p2pOrderInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to order
  int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderInfoRequestToJson(this);
}
