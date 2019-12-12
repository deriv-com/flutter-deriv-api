/// Autogenerated from flutter_deriv_api|lib/api/p2p_order_confirm_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'p2p_order_confirm_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderConfirmRequest {
  P2pOrderConfirmRequest(
      {this.orderId, this.p2pOrderConfirm, this.passthrough, this.reqId});
  factory P2pOrderConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderConfirmRequestFromJson(json);
  Map<String, dynamic> toJson() => _$P2pOrderConfirmRequestToJson(this);

  // Properties
  /// The unique identifier for this order.
  String orderId;

  /// Must be 1
  int p2pOrderConfirm;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
