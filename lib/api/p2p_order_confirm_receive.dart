/// generated automatically from flutter_deriv_api|lib/api/p2p_order_confirm_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_order_confirm_receive.g.dart';

/// JSON conversion for 'p2p_order_confirm_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderConfirmResponse extends Response {
  /// Initialize P2pOrderConfirmResponse
  const P2pOrderConfirmResponse({
    this.p2pOrderConfirm,
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
  factory P2pOrderConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderConfirmResponseFromJson(json);

  // Properties
  /// Confirmation details
  final Map<String, dynamic> p2pOrderConfirm;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderConfirmResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pOrderConfirmResponse copyWith({
    Map<String, dynamic> p2pOrderConfirm,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pOrderConfirmResponse(
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
