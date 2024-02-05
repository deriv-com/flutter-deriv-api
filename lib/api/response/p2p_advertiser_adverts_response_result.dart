// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_adverts_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_adverts_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p advertiser adverts response model class.
abstract class P2pAdvertiserAdvertsResponseModel {
  /// Initializes P2p advertiser adverts response model class .
  const P2pAdvertiserAdvertsResponseModel({
    this.p2pAdvertiserAdverts,
  });

  /// List of the P2P advertiser adverts.
  final P2pAdvertiserAdverts? p2pAdvertiserAdverts;
}

/// P2p advertiser adverts response class.
class P2pAdvertiserAdvertsResponse extends P2pAdvertiserAdvertsResponseModel {
  /// Initializes P2p advertiser adverts response class.
  const P2pAdvertiserAdvertsResponse({
    super.p2pAdvertiserAdverts,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserAdvertsResponse.fromJson(
    dynamic p2pAdvertiserAdvertsJson,
  ) =>
      P2pAdvertiserAdvertsResponse(
        p2pAdvertiserAdverts: p2pAdvertiserAdvertsJson == null
            ? null
            : P2pAdvertiserAdverts.fromJson(p2pAdvertiserAdvertsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserAdverts != null) {
      resultMap['p2p_advertiser_adverts'] = p2pAdvertiserAdverts!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Returns all P2P (peer to peer) adverts created by the authorized client.
  /// Can only be used by a registered P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserAdvertsRequest].
  static Future<P2pAdvertiserAdvertsResponse> fetchAdvertiserAdverts(
    P2pAdvertiserAdvertsRequest request,
  ) async {
    final P2pAdvertiserAdvertsReceive response =
        await fetchAdvertiserAdvertsRaw(request);

    return P2pAdvertiserAdvertsResponse.fromJson(response.p2pAdvertiserAdverts);
  }

  /// Returns all P2P (peer to peer) adverts created by the authorized client.
  /// Can only be used by a registered P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserAdvertsRequest].
  static Future<P2pAdvertiserAdvertsReceive> fetchAdvertiserAdvertsRaw(
    P2pAdvertiserAdvertsRequest request,
  ) async {
    final P2pAdvertiserAdvertsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserAdvertsResponse copyWith({
    P2pAdvertiserAdverts? p2pAdvertiserAdverts,
  }) =>
      P2pAdvertiserAdvertsResponse(
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
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
/// P2p advertiser adverts model class.
abstract class P2pAdvertiserAdvertsModel {
  /// Initializes P2p advertiser adverts model class .
  const P2pAdvertiserAdvertsModel({
    required this.list,
  });

  /// List of advertiser adverts.
  final List<ListItem> list;
}

/// P2p advertiser adverts class.
class P2pAdvertiserAdverts extends P2pAdvertiserAdvertsModel {
  /// Initializes P2p advertiser adverts class.
  const P2pAdvertiserAdverts({
    required super.list,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserAdverts.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserAdverts(
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
  P2pAdvertiserAdverts copyWith({
    List<ListItem>? list,
  }) =>
      P2pAdvertiserAdverts(
        list: list ?? this.list,
      );
}
/// List item model class.
abstract class ListItemModel {
  /// Initializes List item model class .
  const ListItemModel({
    required this.type,
    required this.remainingAmountDisplay,
    required this.remainingAmount,
    required this.rateType,
    required this.rateDisplay,
    required this.rate,
    required this.paymentInfo,
    required this.orderExpiryPeriod,
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
    required this.contactInfo,
    required this.blockTrade,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.activeOrders,
    required this.accountCurrency,
    this.daysUntilArchive,
    this.effectiveRate,
    this.effectiveRateDisplay,
    this.eligibleCountries,
    this.minCompletionRate,
    this.minJoinDays,
    this.minRating,
    this.paymentMethod,
    this.paymentMethodNames,
    this.price,
    this.priceDisplay,
    this.visibilityStatus,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum type;

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

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// Expiry period (seconds) for order created against this ad.
  final int orderExpiryPeriod;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Minimum order amount, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountDisplay;

  /// Minimum order amount, in `account_currency`.
  final double minOrderAmount;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountLimitDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double maxOrderAmountLimit;

  /// Maximum order amount, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountDisplay;

  /// Maximum order amount, in `account_currency`.
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

  /// This is the type of transaction from the counterparty's perspective.
  final CounterpartyTypeEnum counterpartyType;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// Indicates if this is block trade advert or not.
  final bool blockTrade;

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

  /// Days until automatic inactivation of this ad, if no activity occurs.
  final int? daysUntilArchive;

  /// Conversion rate from account currency to local currency, using current market rate if applicable.
  final double? effectiveRate;

  /// Conversion rate from account currency to local currency, using current market rate if applicable, formatted to appropriate decimal places.
  final String? effectiveRateDisplay;

  /// 2 letter country codes. Counterparties who do not live in these countries are not allowed to place orders.
  final List<String>? eligibleCountries;

  /// Counterparties who have a 30 day completion rate less than this value are not allowed to place orders.
  final double? minCompletionRate;

  /// Counterparties who joined less than this number of days ago are not allowed to place orders.
  final int? minJoinDays;

  /// Counterparties who have an average rating less than this value are not allowed to place orders.
  final double? minRating;

  /// Payment method name (deprecated).
  final String? paymentMethod;

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
    required super.activeOrders,
    required super.advertiserDetails,
    required super.amount,
    required super.amountDisplay,
    required super.blockTrade,
    required super.contactInfo,
    required super.counterpartyType,
    required super.country,
    required super.createdTime,
    required super.description,
    required super.id,
    required super.isActive,
    required super.isVisible,
    required super.localCurrency,
    required super.maxOrderAmount,
    required super.maxOrderAmountDisplay,
    required super.maxOrderAmountLimit,
    required super.maxOrderAmountLimitDisplay,
    required super.minOrderAmount,
    required super.minOrderAmountDisplay,
    required super.minOrderAmountLimit,
    required super.minOrderAmountLimitDisplay,
    required super.orderExpiryPeriod,
    required super.paymentInfo,
    required super.rate,
    required super.rateDisplay,
    required super.rateType,
    required super.remainingAmount,
    required super.remainingAmountDisplay,
    required super.type,
    super.daysUntilArchive,
    super.effectiveRate,
    super.effectiveRateDisplay,
    super.eligibleCountries,
    super.minCompletionRate,
    super.minJoinDays,
    super.minRating,
    super.paymentMethod,
    super.paymentMethodNames,
    super.price,
    super.priceDisplay,
    super.visibilityStatus,
  });

  /// Creates an instance from JSON.
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        accountCurrency: json['account_currency'],
        activeOrders: json['active_orders'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        blockTrade: getBool(json['block_trade'])!,
        contactInfo: json['contact_info'],
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
        orderExpiryPeriod: json['order_expiry_period'],
        paymentInfo: json['payment_info'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        rateType: rateTypeEnumMapper[json['rate_type']]!,
        remainingAmount: getDouble(json['remaining_amount'])!,
        remainingAmountDisplay: json['remaining_amount_display'],
        type: typeEnumMapper[json['type']]!,
        daysUntilArchive: json['days_until_archive'],
        effectiveRate: getDouble(json['effective_rate']),
        effectiveRateDisplay: json['effective_rate_display'],
        eligibleCountries: json['eligible_countries'] == null
            ? null
            : List<String>.from(
                json['eligible_countries']?.map(
                  (dynamic item) => item,
                ),
              ),
        minCompletionRate: getDouble(json['min_completion_rate']),
        minJoinDays: json['min_join_days'],
        minRating: getDouble(json['min_rating']),
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
    resultMap['block_trade'] = blockTrade;
    resultMap['contact_info'] = contactInfo;
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
    resultMap['order_expiry_period'] = orderExpiryPeriod;
    resultMap['payment_info'] = paymentInfo;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['rate_type'] = rateTypeEnumMapper.entries
        .firstWhere(
            (MapEntry<String, RateTypeEnum> entry) => entry.value == rateType)
        .key;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['days_until_archive'] = daysUntilArchive;
    resultMap['effective_rate'] = effectiveRate;
    resultMap['effective_rate_display'] = effectiveRateDisplay;
    if (eligibleCountries != null) {
      resultMap['eligible_countries'] = eligibleCountries!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['min_completion_rate'] = minCompletionRate;
    resultMap['min_join_days'] = minJoinDays;
    resultMap['min_rating'] = minRating;
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
    int? activeOrders,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    bool? blockTrade,
    String? contactInfo,
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
    int? orderExpiryPeriod,
    String? paymentInfo,
    double? rate,
    String? rateDisplay,
    RateTypeEnum? rateType,
    double? remainingAmount,
    String? remainingAmountDisplay,
    TypeEnum? type,
    int? daysUntilArchive,
    double? effectiveRate,
    String? effectiveRateDisplay,
    List<String>? eligibleCountries,
    double? minCompletionRate,
    int? minJoinDays,
    double? minRating,
    String? paymentMethod,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    List<VisibilityStatusItemEnum>? visibilityStatus,
  }) =>
      ListItem(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        activeOrders: activeOrders ?? this.activeOrders,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        blockTrade: blockTrade ?? this.blockTrade,
        contactInfo: contactInfo ?? this.contactInfo,
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
        orderExpiryPeriod: orderExpiryPeriod ?? this.orderExpiryPeriod,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        rateType: rateType ?? this.rateType,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
        type: type ?? this.type,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
        effectiveRate: effectiveRate ?? this.effectiveRate,
        effectiveRateDisplay: effectiveRateDisplay ?? this.effectiveRateDisplay,
        eligibleCountries: eligibleCountries ?? this.eligibleCountries,
        minCompletionRate: minCompletionRate ?? this.minCompletionRate,
        minJoinDays: minJoinDays ?? this.minJoinDays,
        minRating: minRating ?? this.minRating,
        paymentMethod: paymentMethod ?? this.paymentMethod,
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
    required super.completedOrdersCount,
    required super.id,
    required super.isOnline,
    required super.name,
    required super.ratingCount,
    super.firstName,
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
