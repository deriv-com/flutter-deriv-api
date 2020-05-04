/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_create_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_advert_create_send.g.dart';

/// JSON conversion for 'p2p_advert_create_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertCreateRequest extends Request {
  /// Initialize P2pAdvertCreateRequest
  const P2pAdvertCreateRequest({
    this.amount,
    this.contactInfo,
    this.description,
    this.localCurrency,
    this.maxOrderAmount,
    this.minOrderAmount,
    this.p2pAdvertCreate = 1,
    this.paymentInfo,
    this.paymentMethod,
    this.rate,
    this.type,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advert_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pAdvertCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertCreateRequestFromJson(json);

  // Properties
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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertCreateRequestToJson(this);

  /// Creates copy of instance with given parameters
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
