/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_create_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'p2p_advert_create_send.g.dart';

/// JSON conversion for 'p2p_advert_create_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertCreateRequest extends Request {
  /// Initialize P2pAdvertCreateRequest
  const P2pAdvertCreateRequest({
    this.amount,
    this.contactInfo,
    this.country,
    this.description,
    this.localCurrency,
    this.maxOrderAmount,
    this.minOrderAmount,
    this.p2pAdvertCreate = 1,
    this.paymentInfo,
    this.paymentMethod,
    this.rate,
    this.type,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory P2pAdvertCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertCreateRequestFromJson(json);

  // Properties
  /// The total amount of the advert, in advertiser's account currency.
  final num amount;

  /// [Optional] Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// [Optional] The target country code of the advert. If not provided, will use client's residence by default.
  final String country;

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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertCreateRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertCreateRequest copyWith({
    num amount,
    String contactInfo,
    String country,
    String description,
    String localCurrency,
    num maxOrderAmount,
    num minOrderAmount,
    int p2pAdvertCreate,
    String paymentInfo,
    String paymentMethod,
    num rate,
    String type,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      P2pAdvertCreateRequest(
        amount: amount ?? this.amount,
        contactInfo: contactInfo ?? this.contactInfo,
        country: country ?? this.country,
        description: description ?? this.description,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        rate: rate ?? this.rate,
        type: type ?? this.type,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
