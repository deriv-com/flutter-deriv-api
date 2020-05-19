/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_create_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_order_create_receive.g.dart';

/// JSON conversion for 'p2p_order_create_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class P2pOrderCreateResponse extends Response {
  /// Initialize P2pOrderCreateResponse
  const P2pOrderCreateResponse({
    this.p2pOrderCreate,
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
  factory P2pOrderCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderCreateResponseFromJson(json);

  // Properties
  /// Information of the creates P2P order.
  final Map<String, dynamic> p2pOrderCreate;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderCreateResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCreateResponse copyWith({
    Map<String, dynamic> p2pOrderCreate,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pOrderCreateResponse(
        p2pOrderCreate: p2pOrderCreate ?? this.p2pOrderCreate,
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
