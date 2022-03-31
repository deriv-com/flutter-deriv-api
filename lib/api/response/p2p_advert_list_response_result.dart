// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/p2p_advert_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p advert list response model class.
abstract class P2pAdvertListResponseModel extends Equatable {
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
    P2pAdvertList? p2pAdvertList,
  }) : super(
          p2pAdvertList: p2pAdvertList,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Returns available adverts.
  ///
  /// For parameters information refer to [P2pAdvertListRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertListResponse> fetchAdvertList(
    P2pAdvertListRequest request,
  ) async {
    final P2pAdvertListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertListResponse.fromJson(response.p2pAdvertList);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertListResponse copyWith({
    P2pAdvertList? p2pAdvertList,
  }) =>
      P2pAdvertListResponse(
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
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
/// P2p advert list model class.
abstract class P2pAdvertListModel extends Equatable {
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
    required List<ListItem> list,
  }) : super(
          list: list,
        );

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
    required List<ListItem> list,
  }) =>
      P2pAdvertList(
        list: list,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// List item model class.
abstract class ListItemModel extends Equatable {
  /// Initializes List item model class .
  const ListItemModel({
    required this.type,
    required this.rateType,
    required this.rateDisplay,
    required this.rate,
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
    required this.advertiserDetails,
    required this.accountCurrency,
    this.activeOrders,
    this.amount,
    this.amountDisplay,
    this.contactInfo,
    this.daysUntilArchive,
    this.effectiveRate,
    this.effectiveRateDisplay,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
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

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double? maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible to the advert owner.
  final String? maxOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double? minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible to the advert owner.
  final String? minOrderAmountDisplay;

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
  /// - `advertiser_daily_limit`: the advertiser's remaining daily limit is less than the minimum order.
  /// - `advertiser_temp_ban`: the advertiser is temporarily banned from P2P.
  final List<VisibilityStatusItemEnum>? visibilityStatus;
}

/// List item class.
class ListItem extends ListItemModel {
  /// Initializes List item class.
  const ListItem({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required bool isVisible,
    required String localCurrency,
    required double maxOrderAmountLimit,
    required String maxOrderAmountLimitDisplay,
    required double minOrderAmountLimit,
    required String minOrderAmountLimitDisplay,
    required double rate,
    required String rateDisplay,
    required RateTypeEnum rateType,
    required TypeEnum type,
    int? activeOrders,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    int? daysUntilArchive,
    double? effectiveRate,
    String? effectiveRateDisplay,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
    String? paymentInfo,
    String? paymentMethod,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    double? remainingAmount,
    String? remainingAmountDisplay,
    List<VisibilityStatusItemEnum>? visibilityStatus,
  }) : super(
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          isVisible: isVisible,
          localCurrency: localCurrency,
          maxOrderAmountLimit: maxOrderAmountLimit,
          maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
          minOrderAmountLimit: minOrderAmountLimit,
          minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          rateType: rateType,
          type: type,
          activeOrders: activeOrders,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          daysUntilArchive: daysUntilArchive,
          effectiveRate: effectiveRate,
          effectiveRateDisplay: effectiveRateDisplay,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodNames: paymentMethodNames,
          price: price,
          priceDisplay: priceDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          visibilityStatus: visibilityStatus,
        );

  /// Creates an instance from JSON.
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        accountCurrency: json['account_currency'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
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
        maxOrderAmount: getDouble(json['max_order_amount']),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
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
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
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
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required bool isVisible,
    required String localCurrency,
    required double maxOrderAmountLimit,
    required String maxOrderAmountLimitDisplay,
    required double minOrderAmountLimit,
    required String minOrderAmountLimitDisplay,
    required double rate,
    required String rateDisplay,
    required RateTypeEnum rateType,
    required TypeEnum type,
    int? activeOrders,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    int? daysUntilArchive,
    double? effectiveRate,
    String? effectiveRateDisplay,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
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
        accountCurrency: accountCurrency,
        advertiserDetails: advertiserDetails,
        counterpartyType: counterpartyType,
        country: country,
        createdTime: createdTime,
        description: description,
        id: id,
        isActive: isActive,
        isVisible: isVisible,
        localCurrency: localCurrency,
        maxOrderAmountLimit: maxOrderAmountLimit,
        maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
        minOrderAmountLimit: minOrderAmountLimit,
        minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
        rate: rate,
        rateDisplay: rateDisplay,
        rateType: rateType,
        type: type,
        activeOrders: activeOrders ?? this.activeOrders,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
        effectiveRate: effectiveRate ?? this.effectiveRate,
        effectiveRateDisplay: effectiveRateDisplay ?? this.effectiveRateDisplay,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountDisplay:
            maxOrderAmountDisplay ?? this.maxOrderAmountDisplay,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel extends Equatable {
  /// Initializes Advertiser details model class .
  const AdvertiserDetailsModel({
    required this.name,
    required this.id,
    required this.completedOrdersCount,
    this.firstName,
    this.isFavourite,
    this.lastName,
    this.totalCompletionRate,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's unique identifier.
  final String id;

  /// The total number of orders completed in the past 30 days.
  final int completedOrdersCount;

  /// The advertiser's first name.
  final String? firstName;

  /// Indicates that the advertiser is a favourite.
  final int? isFavourite;

  /// The advertiser's last name.
  final String? lastName;

  /// The percentage of successfully completed orders made by or placed against the advertiser within the past 30 days.
  final double? totalCompletionRate;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes Advertiser details class.
  const AdvertiserDetails({
    required int completedOrdersCount,
    required String id,
    required String name,
    String? firstName,
    int? isFavourite,
    String? lastName,
    double? totalCompletionRate,
  }) : super(
          completedOrdersCount: completedOrdersCount,
          id: id,
          name: name,
          firstName: firstName,
          isFavourite: isFavourite,
          lastName: lastName,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        completedOrdersCount: json['completed_orders_count'],
        id: json['id'],
        name: json['name'],
        firstName: json['first_name'],
        isFavourite: json['is_favourite'],
        lastName: json['last_name'],
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['completed_orders_count'] = completedOrdersCount;
    resultMap['id'] = id;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['is_favourite'] = isFavourite;
    resultMap['last_name'] = lastName;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertiserDetails copyWith({
    required int completedOrdersCount,
    required String id,
    required String name,
    String? firstName,
    int? isFavourite,
    String? lastName,
    double? totalCompletionRate,
  }) =>
      AdvertiserDetails(
        completedOrdersCount: completedOrdersCount,
        id: id,
        name: name,
        firstName: firstName ?? this.firstName,
        isFavourite: isFavourite ?? this.isFavourite,
        lastName: lastName ?? this.lastName,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
