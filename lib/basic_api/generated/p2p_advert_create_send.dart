/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_create_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advert create request class.
class P2pAdvertCreateRequest extends Request {
  /// Initialize P2pAdvertCreateRequest.
  const P2pAdvertCreateRequest({
    required this.amount,
    this.blockTrade,
    this.contactInfo,
    this.description,
    this.localCurrency,
    required this.maxOrderAmount,
    required this.minOrderAmount,
    this.orderExpiryPeriod,
    this.p2pAdvertCreate = true,
    this.paymentInfo,
    this.paymentMethod,
    required this.paymentMethodIds,
    required this.paymentMethodNames,
    required this.rate,
    required this.rateType,
    required this.type,
    super.msgType = 'p2p_advert_create',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertCreateRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreateRequest(
        amount: json['amount'] as num?,
        blockTrade:
            json['block_trade'] == null ? null : json['block_trade'] == 1,
        contactInfo: json['contact_info'] as String?,
        description: json['description'] as String?,
        localCurrency: json['local_currency'] as String?,
        maxOrderAmount: json['max_order_amount'] as num?,
        minOrderAmount: json['min_order_amount'] as num?,
        orderExpiryPeriod: json['order_expiry_period'] as int?,
        p2pAdvertCreate: json['p2p_advert_create'] == null
            ? null
            : json['p2p_advert_create'] == 1,
        paymentInfo: json['payment_info'] as String?,
        paymentMethod: json['payment_method'] as String?,
        paymentMethodIds: (json['payment_method_ids'] as List<dynamic>?)
            ?.map<int>((dynamic item) => item as int)
            .toList(),
        paymentMethodNames: (json['payment_method_names'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        rate: json['rate'] as num?,
        rateType: json['rate_type'] as String?,
        type: json['type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The total amount of the advert, in advertiser's account currency.
  final num? amount;

  /// [Optional] Indicates if this is block trade ad or not. Default: `false`.
  final bool? blockTrade;

  /// [Optional] Advertiser contact information.
  final String? contactInfo;

  /// [Optional] General information about the advert.
  final String? description;

  /// [Optional] Local currency for this advert. If not provided, will use the currency of client's residence by default.
  final String? localCurrency;

  /// Maximum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be more than or equal to `min_order_amount`
  final num? maxOrderAmount;

  /// Minimum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be less than or equal to `max_order_amount`.
  final num? minOrderAmount;

  /// [Optional] Expiry period (seconds) for order created against this ad.
  final int? orderExpiryPeriod;

  /// Must be `true`
  final bool? p2pAdvertCreate;

  /// [Optional] Payment instructions.
  final String? paymentInfo;

  /// [Optional] Payment method name (deprecated).
  final String? paymentMethod;

  /// IDs of previously saved payment methods as returned from p2p_advertiser_payment_methods, only applicable for sell ads.
  final List<int>? paymentMethodIds;

  /// Payment method identifiers as returned from p2p_payment_methods, only applicable for buy ads.
  final List<String>? paymentMethodNames;

  /// Conversion rate from advertiser's account currency to `local_currency`. An absolute rate value (fixed), or percentage offset from current market rate (floating).
  final num? rate;

  /// Type of rate, fixed or floating.
  final String? rateType;

  /// The advertisement represents the intention to perform this action on your Deriv account funds.
  final String? type;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'block_trade': blockTrade == null
            ? null
            : blockTrade!
                ? 1
                : 0,
        'contact_info': contactInfo,
        'description': description,
        'local_currency': localCurrency,
        'max_order_amount': maxOrderAmount,
        'min_order_amount': minOrderAmount,
        'order_expiry_period': orderExpiryPeriod,
        'p2p_advert_create': p2pAdvertCreate == null
            ? null
            : p2pAdvertCreate!
                ? 1
                : 0,
        'payment_info': paymentInfo,
        'payment_method': paymentMethod,
        'payment_method_ids': paymentMethodIds,
        'payment_method_names': paymentMethodNames,
        'rate': rate,
        'rate_type': rateType,
        'type': type,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertCreateRequest copyWith({
    num? amount,
    bool? blockTrade,
    String? contactInfo,
    String? description,
    String? localCurrency,
    num? maxOrderAmount,
    num? minOrderAmount,
    int? orderExpiryPeriod,
    bool? p2pAdvertCreate,
    String? paymentInfo,
    String? paymentMethod,
    List<int>? paymentMethodIds,
    List<String>? paymentMethodNames,
    num? rate,
    String? rateType,
    String? type,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertCreateRequest(
        amount: amount ?? this.amount,
        blockTrade: blockTrade ?? this.blockTrade,
        contactInfo: contactInfo ?? this.contactInfo,
        description: description ?? this.description,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        orderExpiryPeriod: orderExpiryPeriod ?? this.orderExpiryPeriod,
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodIds: paymentMethodIds ?? this.paymentMethodIds,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
        rate: rate ?? this.rate,
        rateType: rateType ?? this.rateType,
        type: type ?? this.type,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
