/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_create_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// P2pOrderCreateRequest class
class P2pOrderCreateRequest extends Request {
  /// Initialize P2pOrderCreateRequest
  const P2pOrderCreateRequest({
    @required this.advertId,
    @required this.amount,
    this.contactInfo,
    this.p2pOrderCreate = true,
    this.paymentInfo,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_order_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pOrderCreateRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderCreateRequest(
        advertId: json['advert_id'] as String,
        amount: json['amount'] as num,
        contactInfo: json['contact_info'] as String,
        p2pOrderCreate: json['p2p_order_create'] == null
            ? null
            : json['p2p_order_create'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        paymentInfo: json['payment_info'] as String,
        reqId: json['req_id'] as int,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
      );

  /// The unique identifier for the advert to create an order against.
  final String advertId;

  /// The amount of currency to be bought or sold.
  final num amount;

  /// [Optional] Seller contact information. Only applicable for 'sell orders'.
  final String contactInfo;

  /// Must be `true`
  final bool p2pOrderCreate;

  /// [Optional] Payment instructions. Only applicable for 'sell orders'.
  final String paymentInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to the order.
  final bool subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'advert_id': advertId,
        'amount': amount,
        'contact_info': contactInfo,
        'p2p_order_create':
            p2pOrderCreate == null ? null : p2pOrderCreate ? 1 : 0,
        'passthrough': passthrough,
        'payment_info': paymentInfo,
        'req_id': reqId,
        'subscribe': subscribe == null ? null : subscribe ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCreateRequest copyWith({
    String advertId,
    num amount,
    String contactInfo,
    bool p2pOrderCreate,
    String paymentInfo,
    bool subscribe,
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
