/// generated automatically from flutter_deriv_api|lib/api/p2p_order_info_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_order_info_receive.g.dart';

/// JSON conversion for 'p2p_order_info_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderInfoResponse extends Response {
  /// Initialize P2pOrderInfoResponse
  P2pOrderInfoResponse({
    this.p2pOrderInfo,
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
  factory P2pOrderInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderInfoResponseFromJson(json);

  // Properties
  /// The information of P2P order.
  final Map<String, dynamic> p2pOrderInfo;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderInfoResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pOrderInfoResponse copyWith({
    Map<String, dynamic> p2pOrderInfo,
    Map<String, dynamic> subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: p2pOrderInfo ?? this.p2pOrderInfo,
        subscription: subscription ?? this.subscription,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
