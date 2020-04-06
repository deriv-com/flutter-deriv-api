/// Autogenerated from flutter_deriv_api|lib/api/p2p_order_confirm_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'p2p_order_confirm_receive.g.dart';

/// JSON conversion for 'p2p_order_confirm_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderConfirmResponse extends Response {
  /// Initialize P2pOrderConfirmResponse
  P2pOrderConfirmResponse({
    this.p2pOrderConfirm,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pOrderConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderConfirmResponseFromJson(json);

  // Properties
  /// Confirmation details
  Map<String, dynamic> p2pOrderConfirm;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderConfirmResponseToJson(this);
}
