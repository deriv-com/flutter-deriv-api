/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_update_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advert update request class.
class P2pAdvertUpdateRequest extends Request {
  /// Initialize P2pAdvertUpdateRequest.
  const P2pAdvertUpdateRequest({
    this.contactInfo,
    this.delete,
    this.description,
    this.eligibleCountries,
    required this.id,
    this.isActive,
    this.localCurrency,
    this.loginid,
    this.maxOrderAmount,
    this.minCompletionRate,
    this.minJoinDays,
    this.minOrderAmount,
    this.minRating,
    this.orderExpiryPeriod,
    this.p2pAdvertUpdate = true,
    this.paymentInfo,
    this.paymentMethodIds,
    this.paymentMethodNames,
    this.rate,
    this.rateType,
    this.remainingAmount,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'p2p_advert_update',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertUpdateRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdateRequest(
        contactInfo: json['contact_info'] as String?,
        delete: json['delete'] == null ? null : json['delete'] == 1,
        description: json['description'] as String?,
        eligibleCountries: (json['eligible_countries'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        id: json['id'] as String?,
        isActive: json['is_active'] == null ? null : json['is_active'] == 1,
        localCurrency: json['local_currency'] as String?,
        loginid: json['loginid'] as String?,
        maxOrderAmount: json['max_order_amount'] as num?,
        minCompletionRate: json['min_completion_rate'] as num?,
        minJoinDays: json['min_join_days'] as int?,
        minOrderAmount: json['min_order_amount'] as num?,
        minRating: json['min_rating'] as num?,
        orderExpiryPeriod: json['order_expiry_period'] as int?,
        p2pAdvertUpdate: json['p2p_advert_update'] == null
            ? null
            : json['p2p_advert_update'] == 1,
        paymentInfo: json['payment_info'] as String?,
        paymentMethodIds: (json['payment_method_ids'] as List<dynamic>?)
            ?.map<int>((dynamic item) => item as int)
            .toList(),
        paymentMethodNames: (json['payment_method_names'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        rate: json['rate'] as num?,
        rateType: json['rate_type'] as String?,
        remainingAmount: json['remaining_amount'] as num?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Advertiser contact information.
  final String? contactInfo;

  /// [Optional] If set to `true`, permanently deletes the advert.
  final bool? delete;

  /// [Optional] General information about the advert.
  final String? description;

  /// [Optional] 2 letter country codes. Counterparties who do not live in these countries will not be allowed to place orders against this advert. An empty array or null value will clear the condition.
  final List<String>? eligibleCountries;

  /// The unique identifier for this advert.
  final String? id;

  /// [Optional] Activate or deactivate the advert.
  final bool? isActive;

  /// [Optional] Local currency for this advert.
  final String? localCurrency;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Maximum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be more than or equal to `min_order_amount`.
  final num? maxOrderAmount;

  /// [Optional] Counterparties who have a 30 day completion rate less than this value will not be allowed to place orders against this advert. A an empty array or null value will clear the condition.
  final num? minCompletionRate;

  /// [Optional] Counterparties who joined less than this number of days ago will not be allowed to place orders against this advert. A null value will clear the condition.
  final int? minJoinDays;

  /// [Optional] Minimum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be less than or equal to `max_order_amount`.
  final num? minOrderAmount;

  /// [Optional] Counterparties who have an average rating less than this value will not be allowed to place orders against this advert. A null value will clear the condition.
  final num? minRating;

  /// [Optional] Expiry period (seconds) for order created against this ad.
  final int? orderExpiryPeriod;

  /// Must be `true`
  final bool? p2pAdvertUpdate;

  /// [Optional] Payment instructions.
  final String? paymentInfo;

  /// [Optional] IDs of previously saved payment methods as returned from p2p_advertiser_payment_methods, only applicable for sell ads. Exisiting methods will be replaced.
  final List<int>? paymentMethodIds;

  /// [Optional] Payment method identifiers as returned from p2p_payment_methods, only applicable for buy ads. Exisiting methods will be replaced.
  final List<String>? paymentMethodNames;

  /// [Optional] Conversion rate from advertiser's account currency to `local_currency`. An absolute rate value (fixed), or percentage offset from current market rate (floating).
  final num? rate;

  /// [Optional] Type of rate, fixed or floating.
  final String? rateType;

  /// [Optional] The total available amount of the advert, in advertiser's account currency.
  final num? remainingAmount;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contact_info': contactInfo,
        'delete': delete == null
            ? null
            : delete!
                ? 1
                : 0,
        'description': description,
        'eligible_countries': eligibleCountries,
        'id': id,
        'is_active': isActive == null
            ? null
            : isActive!
                ? 1
                : 0,
        'local_currency': localCurrency,
        'loginid': loginid,
        'max_order_amount': maxOrderAmount,
        'min_completion_rate': minCompletionRate,
        'min_join_days': minJoinDays,
        'min_order_amount': minOrderAmount,
        'min_rating': minRating,
        'order_expiry_period': orderExpiryPeriod,
        'p2p_advert_update': p2pAdvertUpdate == null
            ? null
            : p2pAdvertUpdate!
                ? 1
                : 0,
        'payment_info': paymentInfo,
        'payment_method_ids': paymentMethodIds,
        'payment_method_names': paymentMethodNames,
        'rate': rate,
        'rate_type': rateType,
        'remaining_amount': remainingAmount,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertUpdateRequest copyWith({
    String? contactInfo,
    bool? delete,
    String? description,
    List<String>? eligibleCountries,
    String? id,
    bool? isActive,
    String? localCurrency,
    String? loginid,
    num? maxOrderAmount,
    num? minCompletionRate,
    int? minJoinDays,
    num? minOrderAmount,
    num? minRating,
    int? orderExpiryPeriod,
    bool? p2pAdvertUpdate,
    String? paymentInfo,
    List<int>? paymentMethodIds,
    List<String>? paymentMethodNames,
    num? rate,
    String? rateType,
    num? remainingAmount,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertUpdateRequest(
        contactInfo: contactInfo ?? this.contactInfo,
        delete: delete ?? this.delete,
        description: description ?? this.description,
        eligibleCountries: eligibleCountries ?? this.eligibleCountries,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        localCurrency: localCurrency ?? this.localCurrency,
        loginid: loginid ?? this.loginid,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minCompletionRate: minCompletionRate ?? this.minCompletionRate,
        minJoinDays: minJoinDays ?? this.minJoinDays,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minRating: minRating ?? this.minRating,
        orderExpiryPeriod: orderExpiryPeriod ?? this.orderExpiryPeriod,
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethodIds: paymentMethodIds ?? this.paymentMethodIds,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
        rate: rate ?? this.rate,
        rateType: rateType ?? this.rateType,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
