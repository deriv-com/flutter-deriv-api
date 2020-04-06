/// Autogenerated from flutter_deriv_api|lib/api/p2p_order_list_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'p2p_order_list_receive.g.dart';

/// JSON conversion for 'p2p_order_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderListResponse extends Response {
  /// Initialize P2pOrderListResponse
  P2pOrderListResponse({
    this.p2pOrderList,
    this.subscription,
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
  factory P2pOrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderListResponseFromJson(json);

  // Properties
  /// List of P2P orders.
  Map<String, dynamic> p2pOrderList;

  /// For subscription requests only
  Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderListResponseToJson(this);
}
