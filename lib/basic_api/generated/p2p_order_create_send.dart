/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_create_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_order_create_send.g.dart';

/// JSON conversion for 'p2p_order_create_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderCreateRequest extends Request {
  /// Initialize P2pOrderCreateRequest
  const P2pOrderCreateRequest({
    this.advertId,
    this.amount,
    this.contactInfo,
    this.p2pOrderCreate = 1,
    this.paymentInfo,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_order_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory P2pOrderCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderCreateRequestFromJson(json);

  // Properties
  /// The unique identifier for the advert to create an order against.
  final String advertId;

  /// The amount of currency to be bought or sold.
  final num amount;

  /// [Optional] Seller contact information. Only applicable for 'sell orders'.
  final String contactInfo;

  /// Must be 1
  final int p2pOrderCreate;

  /// [Optional] Payment instructions. Only applicable for 'sell orders'.
  final String paymentInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to the order.
  final int subscribe;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$P2pOrderCreateRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCreateRequest copyWith({
    String advertId,
    num amount,
    String contactInfo,
    int p2pOrderCreate,
    String paymentInfo,
    int subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pOrderCreateRequest(
        advertId: advertId ?? this.advertId,
        amount: amount ?? this.amount,
        contactInfo: contactInfo ?? this.contactInfo,
        p2pOrderCreate: p2pOrderCreate ?? this.p2pOrderCreate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
