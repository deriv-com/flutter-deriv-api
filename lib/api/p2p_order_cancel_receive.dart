/// generated automatically from flutter_deriv_api|lib/api/p2p_order_cancel_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_order_cancel_receive.g.dart';

/// JSON conversion for 'p2p_order_cancel_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderCancelResponse extends Response {
  /// Initialize P2pOrderCancelResponse
  const P2pOrderCancelResponse({
    this.p2pOrderCancel,
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
  factory P2pOrderCancelResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderCancelResponseFromJson(json);

  // Properties
  /// Cancellation details
  final Map<String, dynamic> p2pOrderCancel;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderCancelResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pOrderCancelResponse copyWith({
    Map<String, dynamic> p2pOrderCancel,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pOrderCancelResponse(
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
