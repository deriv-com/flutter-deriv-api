/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_create_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// P2pOrderCreateRequest class
class P2pOrderCreateRequest extends Request {
  /// Initialize P2pOrderCreateRequest
  const P2pOrderCreateRequest({
    @required this.advertId,
    @required this.amount,
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

  /// Creates an instance from JSON
  factory P2pOrderCreateRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderCreateRequest(
        // ignore: avoid_as
        advertId: json['advert_id'] as String,
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as
        contactInfo: json['contact_info'] as String,
        // ignore: avoid_as
        p2pOrderCreate: json['p2p_order_create'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        paymentInfo: json['payment_info'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
      );

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

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'advert_id': advertId,
        'amount': amount,
        'contact_info': contactInfo,
        'p2p_order_create': p2pOrderCreate,
        'passthrough': passthrough,
        'payment_info': paymentInfo,
        'req_id': reqId,
        'subscribe': subscribe,
      };

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
