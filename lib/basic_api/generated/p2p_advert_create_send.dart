/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_create_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// P2p advert create send class
class P2pAdvertCreateSend extends Request {
  /// Initialize P2pAdvertCreateSend
  const P2pAdvertCreateSend({
    @required this.amount,
    this.contactInfo,
    this.description,
    this.localCurrency,
    @required this.maxOrderAmount,
    @required this.minOrderAmount,
    this.p2pAdvertCreate = true,
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
  factory P2pAdvertCreateSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreateSend(
        amount: json['amount'] as num,
        contactInfo: json['contact_info'] as String,
        description: json['description'] as String,
        localCurrency: json['local_currency'] as String,
        maxOrderAmount: json['max_order_amount'] as num,
        minOrderAmount: json['min_order_amount'] as num,
        p2pAdvertCreate: json['p2p_advert_create'] == null
            ? null
            : json['p2p_advert_create'] == 1,
        paymentInfo: json['payment_info'] as String,
        paymentMethod: json['payment_method'] as String,
        rate: json['rate'] as num,
        type: json['type'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
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

  /// Must be `true`
  final bool p2pAdvertCreate;

  /// [Optional] Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// The payment method.
  final String paymentMethod;

  /// Conversion rate from advertiser's account currency to `local_currency`.
  final num rate;

  /// Whether this is a buy or a sell.
  final String type;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'contact_info': contactInfo,
        'description': description,
        'local_currency': localCurrency,
        'max_order_amount': maxOrderAmount,
        'min_order_amount': minOrderAmount,
        'p2p_advert_create': p2pAdvertCreate == null
            ? null
            : p2pAdvertCreate
                ? 1
                : 0,
        'payment_info': paymentInfo,
        'payment_method': paymentMethod,
        'rate': rate,
        'type': type,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertCreateSend copyWith({
    num amount,
    String contactInfo,
    String description,
    String localCurrency,
    num maxOrderAmount,
    num minOrderAmount,
    bool p2pAdvertCreate,
    String paymentInfo,
    String paymentMethod,
    num rate,
    String type,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertCreateSend(
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
