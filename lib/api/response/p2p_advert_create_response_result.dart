// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/p2p_advert_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_create_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_create_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p advert create response model class.
abstract class P2pAdvertCreateResponseModel {
  /// Initializes P2p advert create response model class .
  const P2pAdvertCreateResponseModel({
    this.p2pAdvertCreate,
  });

  /// The information of the created P2P advert.
  final P2pAdvertCreate? p2pAdvertCreate;
}

/// P2p advert create response class.
class P2pAdvertCreateResponse extends P2pAdvertCreateResponseModel {
  /// Initializes P2p advert create response class.
  const P2pAdvertCreateResponse({
    P2pAdvertCreate? p2pAdvertCreate,
  }) : super(
          p2pAdvertCreate: p2pAdvertCreate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertCreateResponse.fromJson(
    dynamic p2pAdvertCreateJson,
  ) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreateJson == null
            ? null
            : P2pAdvertCreate.fromJson(p2pAdvertCreateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertCreate != null) {
      resultMap['p2p_advert_create'] = p2pAdvertCreate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a P2P (peer to peer) advert. Can only be used by an approved P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertCreateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertCreateResponse> createAdvert(
    P2pAdvertCreateRequest request,
  ) async {
    final P2pAdvertCreateReceive response = await createAdvertRaw(request);

    return P2pAdvertCreateResponse.fromJson(response.p2pAdvertCreate);
  }

  /// Creates a P2P (peer to peer) advert. Can only be used by an approved P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertCreateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertCreateReceive> createAdvertRaw(
    P2pAdvertCreateRequest request,
  ) async {
    final P2pAdvertCreateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertCreateResponse copyWith({
    P2pAdvertCreate? p2pAdvertCreate,
  }) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
      );
}

/// CounterpartyTypeEnum mapper.
final Map<String, CounterpartyTypeEnum> counterpartyTypeEnumMapper =
    <String, CounterpartyTypeEnum>{
  "buy": CounterpartyTypeEnum.buy,
  "sell": CounterpartyTypeEnum.sell,
};

/// CounterpartyType Enum.
enum CounterpartyTypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "text": TypeEnum.text,
  "memo": TypeEnum.memo,
};

/// Type Enum.
enum TypeEnum {
  /// text.
  text,

  /// memo.
  memo,
}

/// PaymentMethodDetailsPropertyTypeEnum mapper.
final Map<String, PaymentMethodDetailsPropertyTypeEnum>
    paymentMethodDetailsPropertyTypeEnumMapper =
    <String, PaymentMethodDetailsPropertyTypeEnum>{
  "bank": PaymentMethodDetailsPropertyTypeEnum.bank,
  "ewallet": PaymentMethodDetailsPropertyTypeEnum.ewallet,
  "other": PaymentMethodDetailsPropertyTypeEnum.other,
};

/// Type Enum.
enum PaymentMethodDetailsPropertyTypeEnum {
  /// bank.
  bank,

  /// ewallet.
  ewallet,

  /// other.
  other,
}

/// RateTypeEnum mapper.
final Map<String, RateTypeEnum> rateTypeEnumMapper = <String, RateTypeEnum>{
  "fixed": RateTypeEnum.fixed,
  "float": RateTypeEnum.float,
};

/// RateType Enum.
enum RateTypeEnum {
  /// fixed.
  fixed,

  /// float.
  float,
}

/// P2pAdvertCreateTypeEnum mapper.
final Map<String, P2pAdvertCreateTypeEnum> p2pAdvertCreateTypeEnumMapper =
    <String, P2pAdvertCreateTypeEnum>{
  "buy": P2pAdvertCreateTypeEnum.buy,
  "sell": P2pAdvertCreateTypeEnum.sell,
};

/// Type Enum.
enum P2pAdvertCreateTypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}

/// VisibilityStatusItemEnum mapper.
final Map<String, VisibilityStatusItemEnum> visibilityStatusItemEnumMapper =
    <String, VisibilityStatusItemEnum>{
  "advert_inactive": VisibilityStatusItemEnum.advertInactive,
  "advert_max_limit": VisibilityStatusItemEnum.advertMaxLimit,
  "advert_min_limit": VisibilityStatusItemEnum.advertMinLimit,
  "advert_remaining": VisibilityStatusItemEnum.advertRemaining,
  "advertiser_ads_paused": VisibilityStatusItemEnum.advertiserAdsPaused,
  "advertiser_approval": VisibilityStatusItemEnum.advertiserApproval,
  "advertiser_balance": VisibilityStatusItemEnum.advertiserBalance,
  "advertiser_daily_limit": VisibilityStatusItemEnum.advertiserDailyLimit,
  "advertiser_temp_ban": VisibilityStatusItemEnum.advertiserTempBan,
};

/// VisibilityStatusItem Enum.
enum VisibilityStatusItemEnum {
  /// advert_inactive.
  advertInactive,

  /// advert_max_limit.
  advertMaxLimit,

  /// advert_min_limit.
  advertMinLimit,

  /// advert_remaining.
  advertRemaining,

  /// advertiser_ads_paused.
  advertiserAdsPaused,

  /// advertiser_approval.
  advertiserApproval,

  /// advertiser_balance.
  advertiserBalance,

  /// advertiser_daily_limit.
  advertiserDailyLimit,

  /// advertiser_temp_ban.
  advertiserTempBan,
}
/// P2p advert create model class.
abstract class P2pAdvertCreateModel {
  /// Initializes P2p advert create model class .
  const P2pAdvertCreateModel({
    required this.type,
    required this.remainingAmountDisplay,
    required this.remainingAmount,
    required this.rateType,
    required this.rateDisplay,
    required this.rate,
    required this.minOrderAmountLimitDisplay,
    required this.minOrderAmountLimit,
    required this.minOrderAmountDisplay,
    required this.minOrderAmount,
    required this.maxOrderAmountLimitDisplay,
    required this.maxOrderAmountLimit,
    required this.maxOrderAmountDisplay,
    required this.maxOrderAmount,
    required this.localCurrency,
    required this.isVisible,
    required this.isActive,
    required this.id,
    required this.description,
    required this.createdTime,
    required this.country,
    required this.counterpartyType,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.activeOrders,
    required this.accountCurrency,
    this.contactInfo,
    this.effectiveRate,
    this.effectiveRateDisplay,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.paymentMethodNames,
    this.price,
    this.priceDisplay,
    this.visibilityStatus,
  });

  /// The type of advertisement in relation to the advertiser's Deriv account.
  final P2pAdvertCreateTypeEnum type;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places.
  final String remainingAmountDisplay;

  /// Amount currently available for orders, in `account_currency`.
  final double remainingAmount;

  /// Type of rate, fixed or floating.
  final RateTypeEnum rateType;

  /// Conversion rate formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate from advertiser's account currency to `local_currency`. An absolute rate value (fixed), or percentage offset from current market rate (floating).
  final double rate;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`.
  final double minOrderAmount;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountLimitDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double maxOrderAmountLimit;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountDisplay;

  /// Maximum order amount specified in advert, in `account_currency`.
  final double maxOrderAmount;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String localCurrency;

  /// Indicates that this advert will appear on the main advert list.
  final bool isVisible;

  /// The activation status of the advert.
  final bool isActive;

  /// The unique identifier for this advert.
  final String id;

  /// General information about the advert.
  final String description;

  /// The advert creation time in epoch.
  final DateTime createdTime;

  /// The target country code of the advert.
  final String country;

  /// Type of transaction from the opposite party's perspective.
  final CounterpartyTypeEnum counterpartyType;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The total amount specified in advert, in `account_currency`.
  final double amount;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// The number of active orders against this advert.
  final int activeOrders;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Conversion rate from account currency to local currency, using current market rate if applicable.
  final double? effectiveRate;

  /// Conversion rate from account currency to local currency, using current market rate if applicable, formatted to appropriate decimal places.
  final String? effectiveRateDisplay;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String? paymentInfo;

  /// Payment method name (deprecated).
  final String? paymentMethod;

  /// Details of available payment methods (sell adverts only).
  final Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails;

  /// Names of supported payment methods.
  final List<String>? paymentMethodNames;

  /// Cost of the advert in local currency.
  final double? price;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String? priceDisplay;

  /// Reasons why an advert is not visible. Possible values:
  /// - `advert_inactive`: the advert is set inactive.
  /// - `advert_max_limit`: the minimum order amount exceeds the system maximum order.
  /// - `advert_min_limit`: the maximum order amount is too small to be shown on the advert list.
  /// - `advert_remaining`: the remaining amount of the advert is below the minimum order.
  /// - `advertiser_ads_paused`: the advertiser has paused all adverts.
  /// - `advertiser_approval`: the advertiser's proof of identity is not verified.
  /// - `advertiser_balance`: the advertiser's P2P balance is less than the minimum order.
  /// - `advertiser_daily_limit`: the advertiser's remaining daily limit is less than the minimum order.
  /// - `advertiser_temp_ban`: the advertiser is temporarily banned from P2P.
  final List<VisibilityStatusItemEnum>? visibilityStatus;
}

/// P2p advert create class.
class P2pAdvertCreate extends P2pAdvertCreateModel {
  /// Initializes P2p advert create class.
  const P2pAdvertCreate({
    required String accountCurrency,
    required int activeOrders,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required bool isVisible,
    required String localCurrency,
    required double maxOrderAmount,
    required String maxOrderAmountDisplay,
    required double maxOrderAmountLimit,
    required String maxOrderAmountLimitDisplay,
    required double minOrderAmount,
    required String minOrderAmountDisplay,
    required double minOrderAmountLimit,
    required String minOrderAmountLimitDisplay,
    required double rate,
    required String rateDisplay,
    required RateTypeEnum rateType,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required P2pAdvertCreateTypeEnum type,
    String? contactInfo,
    double? effectiveRate,
    String? effectiveRateDisplay,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    List<VisibilityStatusItemEnum>? visibilityStatus,
  }) : super(
          accountCurrency: accountCurrency,
          activeOrders: activeOrders,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          isVisible: isVisible,
          localCurrency: localCurrency,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          maxOrderAmountLimit: maxOrderAmountLimit,
          maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          minOrderAmountLimit: minOrderAmountLimit,
          minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          rateType: rateType,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
          contactInfo: contactInfo,
          effectiveRate: effectiveRate,
          effectiveRateDisplay: effectiveRateDisplay,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
          paymentMethodNames: paymentMethodNames,
          price: price,
          priceDisplay: priceDisplay,
          visibilityStatus: visibilityStatus,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertCreate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreate(
        accountCurrency: json['account_currency'],
        activeOrders: json['active_orders'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        counterpartyType:
            counterpartyTypeEnumMapper[json['counterparty_type']]!,
        country: json['country'],
        createdTime: getDateTime(json['created_time'])!,
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active'])!,
        isVisible: getBool(json['is_visible'])!,
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount'])!,
        maxOrderAmountDisplay: json['max_order_amount_display'],
        maxOrderAmountLimit: getDouble(json['max_order_amount_limit'])!,
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmount: getDouble(json['min_order_amount'])!,
        minOrderAmountDisplay: json['min_order_amount_display'],
        minOrderAmountLimit: getDouble(json['min_order_amount_limit'])!,
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        rateType: rateTypeEnumMapper[json['rate_type']]!,
        remainingAmount: getDouble(json['remaining_amount'])!,
        remainingAmountDisplay: json['remaining_amount_display'],
        type: p2pAdvertCreateTypeEnumMapper[json['type']]!,
        contactInfo: json['contact_info'],
        effectiveRate: getDouble(json['effective_rate']),
        effectiveRateDisplay: json['effective_rate_display'],
        paymentInfo: json['payment_info'],
        paymentMethod: json['payment_method'],
        paymentMethodDetails: json['payment_method_details'] == null
            ? null
            : Map<String, PaymentMethodDetailsProperty>.fromEntries(
                json['payment_method_details']
                    .entries
                    .map<MapEntry<String, PaymentMethodDetailsProperty>>(
                        (MapEntry<String, dynamic> entry) =>
                            MapEntry<String, PaymentMethodDetailsProperty>(
                                entry.key,
                                PaymentMethodDetailsProperty.fromJson(
                                    entry.value)))),
        paymentMethodNames: json['payment_method_names'] == null
            ? null
            : List<String>.from(
                json['payment_method_names']?.map(
                  (dynamic item) => item,
                ),
              ),
        price: getDouble(json['price']),
        priceDisplay: json['price_display'],
        visibilityStatus: json['visibility_status'] == null
            ? null
            : List<VisibilityStatusItemEnum>.from(
                json['visibility_status']?.map(
                  (dynamic item) => item == null
                      ? null
                      : visibilityStatusItemEnumMapper[item],
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    resultMap['active_orders'] = activeOrders;
    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['counterparty_type'] = counterpartyTypeEnumMapper.entries
        .firstWhere((MapEntry<String, CounterpartyTypeEnum> entry) =>
            entry.value == counterpartyType)
        .key;
    resultMap['country'] = country;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['is_active'] = isActive;
    resultMap['is_visible'] = isVisible;
    resultMap['local_currency'] = localCurrency;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['max_order_amount_limit'] = maxOrderAmountLimit;
    resultMap['max_order_amount_limit_display'] = maxOrderAmountLimitDisplay;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
    resultMap['min_order_amount_limit'] = minOrderAmountLimit;
    resultMap['min_order_amount_limit_display'] = minOrderAmountLimitDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['rate_type'] = rateTypeEnumMapper.entries
        .firstWhere(
            (MapEntry<String, RateTypeEnum> entry) => entry.value == rateType)
        .key;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = p2pAdvertCreateTypeEnumMapper.entries
        .firstWhere((MapEntry<String, P2pAdvertCreateTypeEnum> entry) =>
            entry.value == type)
        .key;
    resultMap['contact_info'] = contactInfo;
    resultMap['effective_rate'] = effectiveRate;
    resultMap['effective_rate_display'] = effectiveRateDisplay;
    resultMap['payment_info'] = paymentInfo;
    resultMap['payment_method'] = paymentMethod;
    resultMap['payment_method_details'] = paymentMethodDetails;
    if (paymentMethodNames != null) {
      resultMap['payment_method_names'] = paymentMethodNames!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    if (visibilityStatus != null) {
      resultMap['visibility_status'] = visibilityStatus!
          .map<dynamic>(
            (VisibilityStatusItemEnum item) => visibilityStatusItemEnumMapper
                .entries
                .firstWhere(
                    (MapEntry<String, VisibilityStatusItemEnum> entry) =>
                        entry.value == item)
                .key,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertCreate copyWith({
    String? accountCurrency,
    int? activeOrders,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    CounterpartyTypeEnum? counterpartyType,
    String? country,
    DateTime? createdTime,
    String? description,
    String? id,
    bool? isActive,
    bool? isVisible,
    String? localCurrency,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? maxOrderAmountLimit,
    String? maxOrderAmountLimitDisplay,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
    double? minOrderAmountLimit,
    String? minOrderAmountLimitDisplay,
    double? rate,
    String? rateDisplay,
    RateTypeEnum? rateType,
    double? remainingAmount,
    String? remainingAmountDisplay,
    P2pAdvertCreateTypeEnum? type,
    String? contactInfo,
    double? effectiveRate,
    String? effectiveRateDisplay,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    List<VisibilityStatusItemEnum>? visibilityStatus,
  }) =>
      P2pAdvertCreate(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        activeOrders: activeOrders ?? this.activeOrders,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        description: description ?? this.description,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isVisible: isVisible ?? this.isVisible,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountDisplay:
            maxOrderAmountDisplay ?? this.maxOrderAmountDisplay,
        maxOrderAmountLimit: maxOrderAmountLimit ?? this.maxOrderAmountLimit,
        maxOrderAmountLimitDisplay:
            maxOrderAmountLimitDisplay ?? this.maxOrderAmountLimitDisplay,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
        minOrderAmountLimit: minOrderAmountLimit ?? this.minOrderAmountLimit,
        minOrderAmountLimitDisplay:
            minOrderAmountLimitDisplay ?? this.minOrderAmountLimitDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        rateType: rateType ?? this.rateType,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
        type: type ?? this.type,
        contactInfo: contactInfo ?? this.contactInfo,
        effectiveRate: effectiveRate ?? this.effectiveRate,
        effectiveRateDisplay: effectiveRateDisplay ?? this.effectiveRateDisplay,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        visibilityStatus: visibilityStatus ?? this.visibilityStatus,
      );
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes Advertiser details model class .
  const AdvertiserDetailsModel({
    required this.ratingCount,
    required this.name,
    required this.isOnline,
    required this.id,
    required this.completedOrdersCount,
    this.firstName,
    this.lastName,
    this.lastOnlineTime,
    this.ratingAverage,
    this.recommendedAverage,
    this.recommendedCount,
    this.totalCompletionRate,
  });

  /// Number of ratings given to the advertiser.
  final int ratingCount;

  /// The advertiser's displayed name.
  final String name;

  /// Indicates if the advertiser is currently online.
  final bool isOnline;

  /// The advertiser's unique identifier.
  final String id;

  /// The total number of orders completed in the past 30 days.
  final int completedOrdersCount;

  /// The advertiser's first name.
  final String? firstName;

  /// The advertiser's last name.
  final String? lastName;

  /// Epoch of the latest time the advertiser was online, up to 6 months.
  final DateTime? lastOnlineTime;

  /// Average rating of the advertiser, range is 1-5.
  final double? ratingAverage;

  /// Percentage of users who have recommended the advertiser.
  final double? recommendedAverage;

  /// Number of times the advertiser has been recommended.
  final int? recommendedCount;

  /// The percentage of successfully completed orders made by or placed against the advertiser within the past 30 days.
  final double? totalCompletionRate;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes Advertiser details class.
  const AdvertiserDetails({
    required int completedOrdersCount,
    required String id,
    required bool isOnline,
    required String name,
    required int ratingCount,
    String? firstName,
    String? lastName,
    DateTime? lastOnlineTime,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    double? totalCompletionRate,
  }) : super(
          completedOrdersCount: completedOrdersCount,
          id: id,
          isOnline: isOnline,
          name: name,
          ratingCount: ratingCount,
          firstName: firstName,
          lastName: lastName,
          lastOnlineTime: lastOnlineTime,
          ratingAverage: ratingAverage,
          recommendedAverage: recommendedAverage,
          recommendedCount: recommendedCount,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        completedOrdersCount: json['completed_orders_count'],
        id: json['id'],
        isOnline: getBool(json['is_online'])!,
        name: json['name'],
        ratingCount: json['rating_count'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        lastOnlineTime: getDateTime(json['last_online_time']),
        ratingAverage: getDouble(json['rating_average']),
        recommendedAverage: getDouble(json['recommended_average']),
        recommendedCount: json['recommended_count'],
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['completed_orders_count'] = completedOrdersCount;
    resultMap['id'] = id;
    resultMap['is_online'] = isOnline;
    resultMap['name'] = name;
    resultMap['rating_count'] = ratingCount;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['last_online_time'] =
        getSecondsSinceEpochDateTime(lastOnlineTime);
    resultMap['rating_average'] = ratingAverage;
    resultMap['recommended_average'] = recommendedAverage;
    resultMap['recommended_count'] = recommendedCount;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertiserDetails copyWith({
    int? completedOrdersCount,
    String? id,
    bool? isOnline,
    String? name,
    int? ratingCount,
    String? firstName,
    String? lastName,
    DateTime? lastOnlineTime,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    double? totalCompletionRate,
  }) =>
      AdvertiserDetails(
        completedOrdersCount: completedOrdersCount ?? this.completedOrdersCount,
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        name: name ?? this.name,
        ratingCount: ratingCount ?? this.ratingCount,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
        ratingAverage: ratingAverage ?? this.ratingAverage,
        recommendedAverage: recommendedAverage ?? this.recommendedAverage,
        recommendedCount: recommendedCount ?? this.recommendedCount,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );
}
/// Payment method details property model class.
abstract class PaymentMethodDetailsPropertyModel {
  /// Initializes Payment method details property model class .
  const PaymentMethodDetailsPropertyModel({
    required this.type,
    required this.method,
    required this.isEnabled,
    required this.fields,
    this.displayName,
    this.usedByAdverts,
    this.usedByOrders,
  });

  /// Payment method type.
  final PaymentMethodDetailsPropertyTypeEnum type;

  /// Payment method identifier.
  final String method;

  /// Indicates whether method is enabled.
  final bool isEnabled;

  /// Payment method fields.
  final Map<String, FieldsProperty> fields;

  /// Display name of payment method.
  final String? displayName;

  /// IDs of adverts that use this payment method.
  final List<String>? usedByAdverts;

  /// IDs of orders that use this payment method.
  final List<String>? usedByOrders;
}

/// Payment method details property class.
class PaymentMethodDetailsProperty extends PaymentMethodDetailsPropertyModel {
  /// Initializes Payment method details property class.
  const PaymentMethodDetailsProperty({
    required Map<String, FieldsProperty> fields,
    required bool isEnabled,
    required String method,
    required PaymentMethodDetailsPropertyTypeEnum type,
    String? displayName,
    List<String>? usedByAdverts,
    List<String>? usedByOrders,
  }) : super(
          fields: fields,
          isEnabled: isEnabled,
          method: method,
          type: type,
          displayName: displayName,
          usedByAdverts: usedByAdverts,
          usedByOrders: usedByOrders,
        );

  /// Creates an instance from JSON.
  factory PaymentMethodDetailsProperty.fromJson(Map<String, dynamic> json) =>
      PaymentMethodDetailsProperty(
        fields: Map<String, FieldsProperty>.fromEntries(json['fields']
            .entries
            .map<MapEntry<String, FieldsProperty>>(
                (MapEntry<String, dynamic> entry) =>
                    MapEntry<String, FieldsProperty>(
                        entry.key, FieldsProperty.fromJson(entry.value)))),
        isEnabled: getBool(json['is_enabled'])!,
        method: json['method'],
        type: paymentMethodDetailsPropertyTypeEnumMapper[json['type']]!,
        displayName: json['display_name'],
        usedByAdverts: json['used_by_adverts'] == null
            ? null
            : List<String>.from(
                json['used_by_adverts']?.map(
                  (dynamic item) => item,
                ),
              ),
        usedByOrders: json['used_by_orders'] == null
            ? null
            : List<String>.from(
                json['used_by_orders']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fields'] = fields;
    resultMap['is_enabled'] = isEnabled;
    resultMap['method'] = method;
    resultMap['type'] = paymentMethodDetailsPropertyTypeEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PaymentMethodDetailsPropertyTypeEnum> entry) =>
                entry.value == type)
        .key;
    resultMap['display_name'] = displayName;
    if (usedByAdverts != null) {
      resultMap['used_by_adverts'] = usedByAdverts!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (usedByOrders != null) {
      resultMap['used_by_orders'] = usedByOrders!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentMethodDetailsProperty copyWith({
    Map<String, FieldsProperty>? fields,
    bool? isEnabled,
    String? method,
    PaymentMethodDetailsPropertyTypeEnum? type,
    String? displayName,
    List<String>? usedByAdverts,
    List<String>? usedByOrders,
  }) =>
      PaymentMethodDetailsProperty(
        fields: fields ?? this.fields,
        isEnabled: isEnabled ?? this.isEnabled,
        method: method ?? this.method,
        type: type ?? this.type,
        displayName: displayName ?? this.displayName,
        usedByAdverts: usedByAdverts ?? this.usedByAdverts,
        usedByOrders: usedByOrders ?? this.usedByOrders,
      );
}
/// Fields property model class.
abstract class FieldsPropertyModel {
  /// Initializes Fields property model class .
  const FieldsPropertyModel({
    required this.value,
    required this.type,
    required this.required,
    required this.displayName,
  });

  /// Current value of payment method field.
  final String value;

  /// Field type.
  final TypeEnum type;

  /// Is field required or optional.
  final int required;

  /// Display name of payment method field.
  final String displayName;
}

/// Fields property class.
class FieldsProperty extends FieldsPropertyModel {
  /// Initializes Fields property class.
  const FieldsProperty({
    required String displayName,
    required int required,
    required TypeEnum type,
    required String value,
  }) : super(
          displayName: displayName,
          required: required,
          type: type,
          value: value,
        );

  /// Creates an instance from JSON.
  factory FieldsProperty.fromJson(Map<String, dynamic> json) => FieldsProperty(
        displayName: json['display_name'],
        required: json['required'],
        type: typeEnumMapper[json['type']]!,
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['required'] = required;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FieldsProperty copyWith({
    String? displayName,
    int? required,
    TypeEnum? type,
    String? value,
  }) =>
      FieldsProperty(
        displayName: displayName ?? this.displayName,
        required: required ?? this.required,
        type: type ?? this.type,
        value: value ?? this.value,
      );
}
