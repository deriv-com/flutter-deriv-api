// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_update_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_update_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p advert update response model class.
abstract class P2pAdvertUpdateResponseModel {
  /// Initializes P2p advert update response model class .
  const P2pAdvertUpdateResponseModel({
    this.p2pAdvertUpdate,
  });

  /// P2P updated advert information.
  final P2pAdvertUpdate? p2pAdvertUpdate;
}

/// P2p advert update response class.
class P2pAdvertUpdateResponse extends P2pAdvertUpdateResponseModel {
  /// Initializes P2p advert update response class.
  const P2pAdvertUpdateResponse({
    P2pAdvertUpdate? p2pAdvertUpdate,
  }) : super(
          p2pAdvertUpdate: p2pAdvertUpdate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertUpdateResponse.fromJson(
    dynamic p2pAdvertUpdateJson,
  ) =>
      P2pAdvertUpdateResponse(
        p2pAdvertUpdate: p2pAdvertUpdateJson == null
            ? null
            : P2pAdvertUpdate.fromJson(p2pAdvertUpdateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertUpdate != null) {
      resultMap['p2p_advert_update'] = p2pAdvertUpdate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// For parameters information refer to [P2pAdvertUpdateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertUpdateResponse> updateAdvert(
    P2pAdvertUpdateRequest request,
  ) async {
    final P2pAdvertUpdateReceive response = await updateAdvertRaw(request);

    return P2pAdvertUpdateResponse.fromJson(response.p2pAdvertUpdate);
  }

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// For parameters information refer to [P2pAdvertUpdateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertUpdateReceive> updateAdvertRaw(
    P2pAdvertUpdateRequest request,
  ) async {
    final P2pAdvertUpdateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertUpdateResponse copyWith({
    P2pAdvertUpdate? p2pAdvertUpdate,
  }) =>
      P2pAdvertUpdateResponse(
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
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

/// P2pAdvertUpdateTypeEnum mapper.
final Map<String, P2pAdvertUpdateTypeEnum> p2pAdvertUpdateTypeEnumMapper =
    <String, P2pAdvertUpdateTypeEnum>{
  "buy": P2pAdvertUpdateTypeEnum.buy,
  "sell": P2pAdvertUpdateTypeEnum.sell,
};

/// Type Enum.
enum P2pAdvertUpdateTypeEnum {
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
/// P2p advert update model class.
abstract class P2pAdvertUpdateModel {
  /// Initializes P2p advert update model class .
  const P2pAdvertUpdateModel({
    required this.id,
    this.accountCurrency,
    this.activeOrders,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.contactInfo,
    this.counterpartyType,
    this.country,
    this.createdTime,
    this.daysUntilArchive,
    this.deleted,
    this.description,
    this.effectiveRate,
    this.effectiveRateDisplay,
    this.isActive,
    this.isVisible,
    this.localCurrency,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.maxOrderAmountLimit,
    this.maxOrderAmountLimitDisplay,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
    this.minOrderAmountLimit,
    this.minOrderAmountLimitDisplay,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.paymentMethodNames,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.rateType,
    this.remainingAmount,
    this.remainingAmountDisplay,
    this.type,
    this.visibilityStatus,
  });

  /// The unique identifier for this advert.
  final String id;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String? accountCurrency;

  /// The number of active orders against this advert.
  final int? activeOrders;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails? advertiserDetails;

  /// The total amount specified in advert, in `account_currency`.
  final double? amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String? amountDisplay;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Type of transaction from the opposite party's perspective.
  final CounterpartyTypeEnum? counterpartyType;

  /// The target country code of the advert.
  final String? country;

  /// The advert creation time in epoch.
  final DateTime? createdTime;

  /// Days until automatic inactivation of this ad, if no activity occurs.
  final int? daysUntilArchive;

  /// Indicates that the advert has been deleted.
  final int? deleted;

  /// General information about the advert.
  final String? description;

  /// Conversion rate from account currency to local currency, using current market rate if applicable.
  final double? effectiveRate;

  /// Conversion rate from account currency to local currency, using current market rate if applicable, formatted to appropriate decimal places.
  final String? effectiveRateDisplay;

  /// The activation status of the advert.
  final bool? isActive;

  /// Indicates that this advert will appear on the main advert list.
  final bool? isVisible;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String? localCurrency;

  /// Maximum order amount specified in advert, in `account_currency`.
  final double? maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String? maxOrderAmountDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double? maxOrderAmountLimit;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String? maxOrderAmountLimitDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible to the advert owner.
  final double? minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String? minOrderAmountDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double? minOrderAmountLimit;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String? minOrderAmountLimitDisplay;

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

  /// Conversion rate from advertiser's account currency to `local_currency`. An absolute rate value (fixed), or percentage offset from current market rate (floating).
  final double? rate;

  /// Conversion rate formatted to appropriate decimal places.
  final String? rateDisplay;

  /// Type of rate, fixed or floating.
  final RateTypeEnum? rateType;

  /// Amount currently available for orders, in `account_currency`.
  final double? remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places.
  final String? remainingAmountDisplay;

  /// Whether this is a buy or a sell.
  final P2pAdvertUpdateTypeEnum? type;

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

/// P2p advert update class.
class P2pAdvertUpdate extends P2pAdvertUpdateModel {
  /// Initializes P2p advert update class.
  const P2pAdvertUpdate({
    required String id,
    String? accountCurrency,
    int? activeOrders,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    CounterpartyTypeEnum? counterpartyType,
    String? country,
    DateTime? createdTime,
    int? daysUntilArchive,
    int? deleted,
    String? description,
    double? effectiveRate,
    String? effectiveRateDisplay,
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
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    double? rate,
    String? rateDisplay,
    RateTypeEnum? rateType,
    double? remainingAmount,
    String? remainingAmountDisplay,
    P2pAdvertUpdateTypeEnum? type,
    List<VisibilityStatusItemEnum>? visibilityStatus,
  }) : super(
          id: id,
          accountCurrency: accountCurrency,
          activeOrders: activeOrders,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          daysUntilArchive: daysUntilArchive,
          deleted: deleted,
          description: description,
          effectiveRate: effectiveRate,
          effectiveRateDisplay: effectiveRateDisplay,
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
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
          paymentMethodNames: paymentMethodNames,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          rateType: rateType,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
          visibilityStatus: visibilityStatus,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertUpdate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdate(
        id: json['id'],
        accountCurrency: json['account_currency'],
        activeOrders: json['active_orders'],
        advertiserDetails: json['advertiser_details'] == null
            ? null
            : AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        counterpartyType: json['counterparty_type'] == null
            ? null
            : counterpartyTypeEnumMapper[json['counterparty_type']],
        country: json['country'],
        createdTime: getDateTime(json['created_time']),
        daysUntilArchive: json['days_until_archive'],
        deleted: json['deleted'],
        description: json['description'],
        effectiveRate: getDouble(json['effective_rate']),
        effectiveRateDisplay: json['effective_rate_display'],
        isActive: getBool(json['is_active']),
        isVisible: getBool(json['is_visible']),
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount']),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        maxOrderAmountLimit: getDouble(json['max_order_amount_limit']),
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
        minOrderAmountLimit: getDouble(json['min_order_amount_limit']),
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
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
        rate: getDouble(json['rate']),
        rateDisplay: json['rate_display'],
        rateType: json['rate_type'] == null
            ? null
            : rateTypeEnumMapper[json['rate_type']],
        remainingAmount: getDouble(json['remaining_amount']),
        remainingAmountDisplay: json['remaining_amount_display'],
        type: json['type'] == null
            ? null
            : p2pAdvertUpdateTypeEnumMapper[json['type']],
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

    resultMap['id'] = id;
    resultMap['account_currency'] = accountCurrency;
    resultMap['active_orders'] = activeOrders;
    if (advertiserDetails != null) {
      resultMap['advertiser_details'] = advertiserDetails!.toJson();
    }
    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['contact_info'] = contactInfo;
    resultMap['counterparty_type'] = counterpartyTypeEnumMapper.entries
        .firstWhere((MapEntry<String, CounterpartyTypeEnum> entry) =>
            entry.value == counterpartyType)
        .key;
    resultMap['country'] = country;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['days_until_archive'] = daysUntilArchive;
    resultMap['deleted'] = deleted;
    resultMap['description'] = description;
    resultMap['effective_rate'] = effectiveRate;
    resultMap['effective_rate_display'] = effectiveRateDisplay;
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
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['rate_type'] = rateTypeEnumMapper.entries
        .firstWhere(
            (MapEntry<String, RateTypeEnum> entry) => entry.value == rateType)
        .key;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = p2pAdvertUpdateTypeEnumMapper.entries
        .firstWhere((MapEntry<String, P2pAdvertUpdateTypeEnum> entry) =>
            entry.value == type)
        .key;
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
  P2pAdvertUpdate copyWith({
    String? id,
    String? accountCurrency,
    int? activeOrders,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    CounterpartyTypeEnum? counterpartyType,
    String? country,
    DateTime? createdTime,
    int? daysUntilArchive,
    int? deleted,
    String? description,
    double? effectiveRate,
    String? effectiveRateDisplay,
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
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    double? rate,
    String? rateDisplay,
    RateTypeEnum? rateType,
    double? remainingAmount,
    String? remainingAmountDisplay,
    P2pAdvertUpdateTypeEnum? type,
    List<VisibilityStatusItemEnum>? visibilityStatus,
  }) =>
      P2pAdvertUpdate(
        id: id ?? this.id,
        accountCurrency: accountCurrency ?? this.accountCurrency,
        activeOrders: activeOrders ?? this.activeOrders,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
        deleted: deleted ?? this.deleted,
        description: description ?? this.description,
        effectiveRate: effectiveRate ?? this.effectiveRate,
        effectiveRateDisplay: effectiveRateDisplay ?? this.effectiveRateDisplay,
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
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        rateType: rateType ?? this.rateType,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
        type: type ?? this.type,
        visibilityStatus: visibilityStatus ?? this.visibilityStatus,
      );
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes Advertiser details model class .
  const AdvertiserDetailsModel({
    required this.ratingCount,
    required this.name,
    required this.id,
    required this.completedOrdersCount,
    this.firstName,
    this.lastName,
    this.ratingAverage,
    this.recommendedAverage,
    this.recommendedCount,
    this.totalCompletionRate,
  });

  /// Number of ratings given to the advertiser.
  final int ratingCount;

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's unique identifier.
  final String id;

  /// The total number of orders completed in the past 30 days.
  final int completedOrdersCount;

  /// The advertiser's first name.
  final String? firstName;

  /// The advertiser's last name.
  final String? lastName;

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
    required String name,
    required int ratingCount,
    String? firstName,
    String? lastName,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    double? totalCompletionRate,
  }) : super(
          completedOrdersCount: completedOrdersCount,
          id: id,
          name: name,
          ratingCount: ratingCount,
          firstName: firstName,
          lastName: lastName,
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
        name: json['name'],
        ratingCount: json['rating_count'],
        firstName: json['first_name'],
        lastName: json['last_name'],
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
    resultMap['name'] = name;
    resultMap['rating_count'] = ratingCount;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
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
    String? name,
    int? ratingCount,
    String? firstName,
    String? lastName,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    double? totalCompletionRate,
  }) =>
      AdvertiserDetails(
        completedOrdersCount: completedOrdersCount ?? this.completedOrdersCount,
        id: id ?? this.id,
        name: name ?? this.name,
        ratingCount: ratingCount ?? this.ratingCount,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
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
  });

  /// Payment method type.
  final PaymentMethodDetailsPropertyTypeEnum type;

  /// Payment method identifier.
  final String method;

  /// Indicates if this method is available on adverts.
  final bool isEnabled;

  /// Payment method fields.
  final Map<String, FieldsProperty> fields;

  /// Display name of payment method.
  final String? displayName;
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
  }) : super(
          fields: fields,
          isEnabled: isEnabled,
          method: method,
          type: type,
          displayName: displayName,
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentMethodDetailsProperty copyWith({
    Map<String, FieldsProperty>? fields,
    bool? isEnabled,
    String? method,
    PaymentMethodDetailsPropertyTypeEnum? type,
    String? displayName,
  }) =>
      PaymentMethodDetailsProperty(
        fields: fields ?? this.fields,
        isEnabled: isEnabled ?? this.isEnabled,
        method: method ?? this.method,
        type: type ?? this.type,
        displayName: displayName ?? this.displayName,
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
