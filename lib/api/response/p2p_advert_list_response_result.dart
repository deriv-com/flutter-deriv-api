// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/p2p_advert_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p advert list response model class.
abstract class P2pAdvertListResponseModel {
  /// Initializes P2p advert list response model class .
  const P2pAdvertListResponseModel({
    this.p2pAdvertList,
  });

  /// P2P adverts list.
  final P2pAdvertList? p2pAdvertList;
}

/// P2p advert list response class.
class P2pAdvertListResponse extends P2pAdvertListResponseModel {
  /// Initializes P2p advert list response class.
  const P2pAdvertListResponse({
    super.p2pAdvertList,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertListResponse.fromJson(
    dynamic p2pAdvertListJson,
  ) =>
      P2pAdvertListResponse(
        p2pAdvertList: p2pAdvertListJson == null
            ? null
            : P2pAdvertList.fromJson(p2pAdvertListJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertList != null) {
      resultMap['p2p_advert_list'] = p2pAdvertList!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Returns available adverts.
  ///
  /// For parameters information refer to [P2pAdvertListRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<P2pAdvertListResponse> fetchAdvertList(
    P2pAdvertListRequest request,
  ) async {
    final P2pAdvertListReceive response = await fetchAdvertListRaw(request);

    return P2pAdvertListResponse.fromJson(response.p2pAdvertList);
  }

  /// Returns available adverts.
  ///
  /// For parameters information refer to [P2pAdvertListRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<P2pAdvertListReceive> fetchAdvertListRaw(
    P2pAdvertListRequest request,
  ) async {
    final P2pAdvertListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertListResponse copyWith({
    P2pAdvertList? p2pAdvertList,
  }) =>
      P2pAdvertListResponse(
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
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

/// EligibilityStatusItemEnum mapper.
final Map<String, EligibilityStatusItemEnum> eligibilityStatusItemEnumMapper =
    <String, EligibilityStatusItemEnum>{
  "completion_rate": EligibilityStatusItemEnum.completionRate,
  "country": EligibilityStatusItemEnum.country,
  "join_date": EligibilityStatusItemEnum.joinDate,
  "rating_average": EligibilityStatusItemEnum.ratingAverage,
};

/// EligibilityStatusItem Enum.
enum EligibilityStatusItemEnum {
  /// completion_rate.
  completionRate,

  /// country.
  country,

  /// join_date.
  joinDate,

  /// rating_average.
  ratingAverage,
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

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "buy": TypeEnum.buy,
  "sell": TypeEnum.sell,
};

/// Type Enum.
enum TypeEnum {
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
  "advertiser_block_trade_ineligible":
      VisibilityStatusItemEnum.advertiserBlockTradeIneligible,
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

  /// advertiser_block_trade_ineligible.
  advertiserBlockTradeIneligible,

  /// advertiser_daily_limit.
  advertiserDailyLimit,

  /// advertiser_temp_ban.
  advertiserTempBan,
}
/// P2p advert list model class.
abstract class P2pAdvertListModel {
  /// Initializes P2p advert list model class .
  const P2pAdvertListModel({
    required this.list,
  });

  /// List of adverts.
  final List<ListItem> list;
}

/// P2p advert list class.
class P2pAdvertList extends P2pAdvertListModel {
  /// Initializes P2p advert list class.
  const P2pAdvertList({
    required super.list,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertList.fromJson(Map<String, dynamic> json) => P2pAdvertList(
        list: List<ListItem>.from(
          json['list'].map(
            (dynamic item) => ListItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['list'] = list
        .map<dynamic>(
          (ListItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertList copyWith({
    List<ListItem>? list,
  }) =>
      P2pAdvertList(
        list: list ?? this.list,
      );
}
/// List item model class.
abstract class ListItemModel {
  /// Initializes List item model class .
  const ListItemModel({
    required this.type,
    required this.rateType,
    required this.rateDisplay,
    required this.rate,
    required this.orderExpiryPeriod,
    required this.minOrderAmountLimitDisplay,
    required this.minOrderAmountLimit,
    required this.maxOrderAmountLimitDisplay,
    required this.maxOrderAmountLimit,
    required this.localCurrency,
    required this.isVisible,
    required this.isActive,
    required this.id,
    required this.description,
    required this.createdTime,
    required this.country,
    required this.counterpartyType,
    required this.blockTrade,
    required this.advertiserDetails,
    required this.accountCurrency,
    this.activeOrders,
    this.amount,
    this.amountDisplay,
    this.contactInfo,
    this.daysUntilArchive,
    this.effectiveRate,
    this.effectiveRateDisplay,
    this.eligibilityStatus,
    this.eligibleCountries,
    this.isEligible,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.minCompletionRate,
    this.minJoinDays,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
    this.minRating,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodNames,
    this.price,
    this.priceDisplay,
    this.remainingAmount,
    this.remainingAmountDisplay,
    this.visibilityStatus,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum type;

  /// Type of rate, fixed or floating.
  final RateTypeEnum rateType;

  /// Conversion rate formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate from advertiser's account currency to `local_currency`. An absolute rate value (fixed), or percentage offset from current market rate (floating).
  final double rate;

  /// Expiry period (seconds) for order created against this ad.
  final int orderExpiryPeriod;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountLimitDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double maxOrderAmountLimit;

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

  /// Indicates if this is block trade advert or not.
  final bool blockTrade;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// The number of active orders against this advert.
  final int? activeOrders;

  /// The total amount specified in advert, in `account_currency`. It is only visible to the advert owner.
  final double? amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible to the advert owner.
  final String? amountDisplay;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Days until automatic inactivation of this ad, if no activity occurs.
  final int? daysUntilArchive;

  /// Conversion rate from account currency to local currency, using current market rate if applicable.
  final double? effectiveRate;

  /// Conversion rate from account currency to local currency, using current market rate if applicable, formatted to appropriate decimal places.
  final String? effectiveRateDisplay;

  /// Reasons why the counterparty terms do not allow the current user to place orders against this advert. Possible values:
  /// - `completion_rate`: current user's 30 day completion rate is less than `min_completion_rate`.
  /// - `country`: current user's residence is not in `eligible_countries`.
  /// - `join_date`: current user registered on P2P less than `min_join_days` in the past.
  /// - `rating`: current user's average review rating is less than `min_rating`.
  final List<EligibilityStatusItemEnum>? eligibilityStatus;

  /// 2 letter country codes. Counterparties who do not live in these countries are not allowed to place orders against this advert.
  final List<String>? eligibleCountries;

  /// Indicates that the current user meets the counterparty terms for placing an order.
  final bool? isEligible;

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double? maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible to the advert owner.
  final String? maxOrderAmountDisplay;

  /// Counterparties who have a 30 day completion rate less than this value are not allowed to place orders against this advert.
  final double? minCompletionRate;

  /// Counterparties who joined less than this number of days ago are not allowed to place orders against this advert.
  final int? minJoinDays;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double? minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible to the advert owner.
  final String? minOrderAmountDisplay;

  /// Counterparties who have an average rating less than this value are not allowed to place orders against this advert.
  final double? minRating;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String? paymentInfo;

  /// Payment method name (deprecated).
  final String? paymentMethod;

  /// Names of supported payment methods.
  final List<String>? paymentMethodNames;

  /// Cost of the advert in local currency.
  final double? price;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String? priceDisplay;

  /// Amount currently available for orders, in `account_currency`. It is only visible to the advert owner.
  final double? remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible to the advert owner.
  final String? remainingAmountDisplay;

  /// Reasons why an advert is not visible, only visible to the advert owner. Possible values:
  /// - `advert_inactive`: the advert is set inactive.
  /// - `advert_max_limit`: the minimum order amount exceeds the system maximum order.
  /// - `advert_min_limit`: the maximum order amount is too small to be shown on the advert list.
  /// - `advert_remaining`: the remaining amount of the advert is below the minimum order.
  /// - `advertiser_ads_paused`: the advertiser has paused all adverts.
  /// - `advertiser_approval`: the advertiser's proof of identity is not verified.
  /// - `advertiser_balance`: the advertiser's P2P balance is less than the minimum order.
  /// - `advertiser_block_trade_ineligible`: the advertiser is not currently eligible for block trading.
  /// - `advertiser_daily_limit`: the advertiser's remaining daily limit is less than the minimum order.
  /// - `advertiser_temp_ban`: the advertiser is temporarily banned from P2P.
  final List<VisibilityStatusItemEnum>? visibilityStatus;
}

/// List item class.
class ListItem extends ListItemModel {
  /// Initializes List item class.
  const ListItem({
    required super.accountCurrency,
    required super.advertiserDetails,
    required super.blockTrade,
    required super.counterpartyType,
    required super.country,
    required super.createdTime,
    required super.description,
    required super.id,
    required super.isActive,
    required super.isVisible,
    required super.localCurrency,
    required super.maxOrderAmountLimit,
    required super.maxOrderAmountLimitDisplay,
    required super.minOrderAmountLimit,
    required super.minOrderAmountLimitDisplay,
    required super.orderExpiryPeriod,
    required super.rate,
    required super.rateDisplay,
    required super.rateType,
    required super.type,
    super.activeOrders,
    super.amount,
    super.amountDisplay,
    super.contactInfo,
    super.daysUntilArchive,
    super.effectiveRate,
    super.effectiveRateDisplay,
    super.eligibilityStatus,
    super.eligibleCountries,
    super.isEligible,
    super.maxOrderAmount,
    super.maxOrderAmountDisplay,
    super.minCompletionRate,
    super.minJoinDays,
    super.minOrderAmount,
    super.minOrderAmountDisplay,
    super.minRating,
    super.paymentInfo,
    super.paymentMethod,
    super.paymentMethodNames,
    super.price,
    super.priceDisplay,
    super.remainingAmount,
    super.remainingAmountDisplay,
    super.visibilityStatus,
  });

  /// Creates an instance from JSON.
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        accountCurrency: json['account_currency'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        blockTrade: getBool(json['block_trade'])!,
        counterpartyType:
            counterpartyTypeEnumMapper[json['counterparty_type']]!,
        country: json['country'],
        createdTime: getDateTime(json['created_time'])!,
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active'])!,
        isVisible: getBool(json['is_visible'])!,
        localCurrency: json['local_currency'],
        maxOrderAmountLimit: getDouble(json['max_order_amount_limit'])!,
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmountLimit: getDouble(json['min_order_amount_limit'])!,
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
        orderExpiryPeriod: json['order_expiry_period'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        rateType: rateTypeEnumMapper[json['rate_type']]!,
        type: typeEnumMapper[json['type']]!,
        activeOrders: json['active_orders'],
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        daysUntilArchive: json['days_until_archive'],
        effectiveRate: getDouble(json['effective_rate']),
        effectiveRateDisplay: json['effective_rate_display'],
        eligibilityStatus: json['eligibility_status'] == null
            ? null
            : List<EligibilityStatusItemEnum>.from(
                json['eligibility_status']?.map(
                  (dynamic item) => item == null
                      ? null
                      : eligibilityStatusItemEnumMapper[item],
                ),
              ),
        eligibleCountries: json['eligible_countries'] == null
            ? null
            : List<String>.from(
                json['eligible_countries']?.map(
                  (dynamic item) => item,
                ),
              ),
        isEligible: getBool(json['is_eligible']),
        maxOrderAmount: getDouble(json['max_order_amount']),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        minCompletionRate: getDouble(json['min_completion_rate']),
        minJoinDays: json['min_join_days'],
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
        minRating: getDouble(json['min_rating']),
        paymentInfo: json['payment_info'],
        paymentMethod: json['payment_method'],
        paymentMethodNames: json['payment_method_names'] == null
            ? null
            : List<String>.from(
                json['payment_method_names']?.map(
                  (dynamic item) => item,
                ),
              ),
        price: getDouble(json['price']),
        priceDisplay: json['price_display'],
        remainingAmount: getDouble(json['remaining_amount']),
        remainingAmountDisplay: json['remaining_amount_display'],
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
    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['block_trade'] = blockTrade;
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
    resultMap['max_order_amount_limit'] = maxOrderAmountLimit;
    resultMap['max_order_amount_limit_display'] = maxOrderAmountLimitDisplay;
    resultMap['min_order_amount_limit'] = minOrderAmountLimit;
    resultMap['min_order_amount_limit_display'] = minOrderAmountLimitDisplay;
    resultMap['order_expiry_period'] = orderExpiryPeriod;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['rate_type'] = rateTypeEnumMapper.entries
        .firstWhere(
            (MapEntry<String, RateTypeEnum> entry) => entry.value == rateType)
        .key;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['active_orders'] = activeOrders;
    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['contact_info'] = contactInfo;
    resultMap['days_until_archive'] = daysUntilArchive;
    resultMap['effective_rate'] = effectiveRate;
    resultMap['effective_rate_display'] = effectiveRateDisplay;
    if (eligibilityStatus != null) {
      resultMap['eligibility_status'] = eligibilityStatus!
          .map<dynamic>(
            (EligibilityStatusItemEnum item) => eligibilityStatusItemEnumMapper
                .entries
                .firstWhere(
                    (MapEntry<String, EligibilityStatusItemEnum> entry) =>
                        entry.value == item)
                .key,
          )
          .toList();
    }
    if (eligibleCountries != null) {
      resultMap['eligible_countries'] = eligibleCountries!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['is_eligible'] = isEligible;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['min_completion_rate'] = minCompletionRate;
    resultMap['min_join_days'] = minJoinDays;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
    resultMap['min_rating'] = minRating;
    resultMap['payment_info'] = paymentInfo;
    resultMap['payment_method'] = paymentMethod;
    if (paymentMethodNames != null) {
      resultMap['payment_method_names'] = paymentMethodNames!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
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
  ListItem copyWith({
    String? accountCurrency,
    AdvertiserDetails? advertiserDetails,
    bool? blockTrade,
    CounterpartyTypeEnum? counterpartyType,
    String? country,
    DateTime? createdTime,
    String? description,
    String? id,
    bool? isActive,
    bool? isVisible,
    String? localCurrency,
    double? maxOrderAmountLimit,
    String? maxOrderAmountLimitDisplay,
    double? minOrderAmountLimit,
    String? minOrderAmountLimitDisplay,
    int? orderExpiryPeriod,
    double? rate,
    String? rateDisplay,
    RateTypeEnum? rateType,
    TypeEnum? type,
    int? activeOrders,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    int? daysUntilArchive,
    double? effectiveRate,
    String? effectiveRateDisplay,
    List<EligibilityStatusItemEnum>? eligibilityStatus,
    List<String>? eligibleCountries,
    bool? isEligible,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? minCompletionRate,
    int? minJoinDays,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
    double? minRating,
    String? paymentInfo,
    String? paymentMethod,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    double? remainingAmount,
    String? remainingAmountDisplay,
    List<VisibilityStatusItemEnum>? visibilityStatus,
  }) =>
      ListItem(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        blockTrade: blockTrade ?? this.blockTrade,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        description: description ?? this.description,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isVisible: isVisible ?? this.isVisible,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmountLimit: maxOrderAmountLimit ?? this.maxOrderAmountLimit,
        maxOrderAmountLimitDisplay:
            maxOrderAmountLimitDisplay ?? this.maxOrderAmountLimitDisplay,
        minOrderAmountLimit: minOrderAmountLimit ?? this.minOrderAmountLimit,
        minOrderAmountLimitDisplay:
            minOrderAmountLimitDisplay ?? this.minOrderAmountLimitDisplay,
        orderExpiryPeriod: orderExpiryPeriod ?? this.orderExpiryPeriod,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        rateType: rateType ?? this.rateType,
        type: type ?? this.type,
        activeOrders: activeOrders ?? this.activeOrders,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
        effectiveRate: effectiveRate ?? this.effectiveRate,
        effectiveRateDisplay: effectiveRateDisplay ?? this.effectiveRateDisplay,
        eligibilityStatus: eligibilityStatus ?? this.eligibilityStatus,
        eligibleCountries: eligibleCountries ?? this.eligibleCountries,
        isEligible: isEligible ?? this.isEligible,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountDisplay:
            maxOrderAmountDisplay ?? this.maxOrderAmountDisplay,
        minCompletionRate: minCompletionRate ?? this.minCompletionRate,
        minJoinDays: minJoinDays ?? this.minJoinDays,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
        minRating: minRating ?? this.minRating,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
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
    this.isBlocked,
    this.isFavourite,
    this.isRecommended,
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

  /// Indicates that the advertiser is blocked by the current user.
  final int? isBlocked;

  /// Indicates that the advertiser is a favourite.
  final bool? isFavourite;

  /// Indicates that the advertiser was recommended in the most recent review by the current user.
  final int? isRecommended;

  /// The advertiser's last name.
  final String? lastName;

  /// Epoch of the latest time the advertiser was online, up to 6 months.
  final DateTime? lastOnlineTime;

  /// Average rating of the advertiser, range is 1-5.
  final double? ratingAverage;

  /// Percentage of users who have recommended the advertiser.
  final double? recommendedAverage;

  /// Number of times the advertiser has been recommended.
  final double? recommendedCount;

  /// The percentage of successfully completed orders made by or placed against the advertiser within the past 30 days.
  final double? totalCompletionRate;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes Advertiser details class.
  const AdvertiserDetails({
    required super.completedOrdersCount,
    required super.id,
    required super.isOnline,
    required super.name,
    required super.ratingCount,
    super.firstName,
    super.isBlocked,
    super.isFavourite,
    super.isRecommended,
    super.lastName,
    super.lastOnlineTime,
    super.ratingAverage,
    super.recommendedAverage,
    super.recommendedCount,
    super.totalCompletionRate,
  });

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        completedOrdersCount: json['completed_orders_count'],
        id: json['id'],
        isOnline: getBool(json['is_online'])!,
        name: json['name'],
        ratingCount: json['rating_count'],
        firstName: json['first_name'],
        isBlocked: json['is_blocked'],
        isFavourite: getBool(json['is_favourite']),
        isRecommended: json['is_recommended'],
        lastName: json['last_name'],
        lastOnlineTime: getDateTime(json['last_online_time']),
        ratingAverage: getDouble(json['rating_average']),
        recommendedAverage: getDouble(json['recommended_average']),
        recommendedCount: getDouble(json['recommended_count']),
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
    resultMap['is_blocked'] = isBlocked;
    resultMap['is_favourite'] = isFavourite;
    resultMap['is_recommended'] = isRecommended;
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
    int? isBlocked,
    bool? isFavourite,
    int? isRecommended,
    String? lastName,
    DateTime? lastOnlineTime,
    double? ratingAverage,
    double? recommendedAverage,
    double? recommendedCount,
    double? totalCompletionRate,
  }) =>
      AdvertiserDetails(
        completedOrdersCount: completedOrdersCount ?? this.completedOrdersCount,
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        name: name ?? this.name,
        ratingCount: ratingCount ?? this.ratingCount,
        firstName: firstName ?? this.firstName,
        isBlocked: isBlocked ?? this.isBlocked,
        isFavourite: isFavourite ?? this.isFavourite,
        isRecommended: isRecommended ?? this.isRecommended,
        lastName: lastName ?? this.lastName,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
        ratingAverage: ratingAverage ?? this.ratingAverage,
        recommendedAverage: recommendedAverage ?? this.recommendedAverage,
        recommendedCount: recommendedCount ?? this.recommendedCount,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );
}
