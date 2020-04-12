/// generated automatically from flutter_deriv_api|lib/api/p2p_order_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_order_list_receive.g.dart';

/// JSON conversion for 'p2p_order_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderListResponse extends Response {
  /// Initialize P2pOrderListResponse
  const P2pOrderListResponse({
    this.p2pOrderList,
    this.subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory P2pOrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderListResponseFromJson(json);

  // Properties
  /// List of P2P orders.
  final Map<String, dynamic> p2pOrderList;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pOrderListResponse copyWith({
    Map<String, dynamic> p2pOrderList,
    Map<String, dynamic> subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pOrderListResponse(
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        subscription: subscription ?? this.subscription,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
