/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_confirm_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_order_confirm_receive.g.dart';

/// JSON conversion for 'p2p_order_confirm_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class P2pOrderConfirmResponse extends Response {
  /// Initialize P2pOrderConfirmResponse
  const P2pOrderConfirmResponse({
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

  /// Creates an instance from JSON
  factory P2pOrderConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderConfirmResponseFromJson(json);

  // Properties
  /// Confirmation details
  final Map<String, dynamic> p2pOrderConfirm;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderConfirmResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderConfirmResponse copyWith({
    Map<String, dynamic> p2pOrderConfirm,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pOrderConfirmResponse(
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
