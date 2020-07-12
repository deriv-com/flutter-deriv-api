/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_create_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// P2pAdvertCreateRequest class
class P2pAdvertCreateRequest extends Request {
  /// Initialize P2pAdvertCreateRequest
  const P2pAdvertCreateRequest({
    @required this.amount,
    this.contactInfo,
    this.description,
    this.localCurrency,
    @required this.maxOrderAmount,
    @required this.minOrderAmount,
    this.p2pAdvertCreate = 1,
    this.paymentInfo,
    @required this.paymentMethod,
    @required this.rate,
    @required this.type,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advert_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertCreateRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreateRequest(
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as
        contactInfo: json['contact_info'] as String,
        // ignore: avoid_as
        description: json['description'] as String,
        // ignore: avoid_as
        localCurrency: json['local_currency'] as String,
        // ignore: avoid_as
        maxOrderAmount: json['max_order_amount'] as num,
        // ignore: avoid_as
        minOrderAmount: json['min_order_amount'] as num,
        // ignore: avoid_as
        p2pAdvertCreate: json['p2p_advert_create'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        paymentInfo: json['payment_info'] as String,
        // ignore: avoid_as
        paymentMethod: json['payment_method'] as String,
        // ignore: avoid_as
        rate: json['rate'] as num,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        type: json['type'] as String,
      );

  /// The total amount of the advert, in advertiser's account currency.
  final num amount;

  /// [Optional] Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// [Optional] General information about the advert.
  final String description;

  /// [Optional] Local currency for this advert. If not provided, will use the currency of client's residence by default.
  final String localCurrency;

  /// Maximum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be less than or equal to total `amount` of the advert.
  final num maxOrderAmount;

  /// Minimum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be less than `max_order_amount`.
  final num minOrderAmount;

  /// Must be 1
  final int p2pAdvertCreate;

  /// [Optional] Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// The payment method.
  final String paymentMethod;

  /// Conversion rate from advertiser's account currency to `local_currency`.
  final num rate;

  /// Whether this is a buy or a sell.
  final String type;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'contact_info': contactInfo,
        'description': description,
        'local_currency': localCurrency,
        'max_order_amount': maxOrderAmount,
        'min_order_amount': minOrderAmount,
        'p2p_advert_create': p2pAdvertCreate,
        'passthrough': passthrough,
        'payment_info': paymentInfo,
        'payment_method': paymentMethod,
        'rate': rate,
        'req_id': reqId,
        'type': type,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertCreateRequest copyWith({
    num amount,
    String contactInfo,
    String description,
    String localCurrency,
    num maxOrderAmount,
    num minOrderAmount,
    int p2pAdvertCreate,
    String paymentInfo,
    String paymentMethod,
    num rate,
    String type,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertCreateRequest(
        amount: amount ?? this.amount,
        contactInfo: contactInfo ?? this.contactInfo,
        description: description ?? this.description,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        rate: rate ?? this.rate,
        type: type ?? this.type,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
