/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_info_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_order_info_receive.g.dart';

/// JSON conversion for 'p2p_order_info_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderInfoResponse extends Response {
  /// Initialize P2pOrderInfoResponse
  const P2pOrderInfoResponse({
    this.p2pOrderInfo,
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

  /// Creates an instance from JSON
  factory P2pOrderInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderInfoResponseFromJson(json);

  /// The information of P2P order.
  final Map<String, dynamic> p2pOrderInfo;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderInfoResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderInfoResponse copyWith({
    Map<String, dynamic> p2pOrderInfo,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: p2pOrderInfo ?? this.p2pOrderInfo,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
