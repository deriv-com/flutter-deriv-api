// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// P2p settings response model class.
abstract class P2pSettingsResponseModel {
  /// Initializes P2p settings response model class .
  const P2pSettingsResponseModel({
    this.p2pSettings,
    this.subscription,
  });

  /// Peer-to-peer payment system settings.
  final P2pSettings? p2pSettings;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// P2p settings response class.
class P2pSettingsResponse extends P2pSettingsResponseModel {
  /// Initializes P2p settings response class.
  const P2pSettingsResponse({
    P2pSettings? p2pSettings,
    Subscription? subscription,
  }) : super(
          p2pSettings: p2pSettings,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory P2pSettingsResponse.fromJson(
    dynamic p2pSettingsJson,
    dynamic subscriptionJson,
  ) =>
      P2pSettingsResponse(
        p2pSettings: p2pSettingsJson == null
            ? null
            : P2pSettings.fromJson(p2pSettingsJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pSettings != null) {
      resultMap['p2p_settings'] = p2pSettings!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pSettingsResponse copyWith({
    P2pSettings? p2pSettings,
    Subscription? subscription,
  }) =>
      P2pSettingsResponse(
        p2pSettings: p2pSettings ?? this.p2pSettings,
        subscription: subscription ?? this.subscription,
      );
}

/// FixedRateAdvertsEnum mapper.
final Map<String, FixedRateAdvertsEnum> fixedRateAdvertsEnumMapper =
    <String, FixedRateAdvertsEnum>{
  "disabled": FixedRateAdvertsEnum.disabled,
  "enabled": FixedRateAdvertsEnum.enabled,
  "list_only": FixedRateAdvertsEnum.listOnly,
};

/// FixedRateAdverts Enum.
enum FixedRateAdvertsEnum {
  /// disabled.
  disabled,

  /// enabled.
  enabled,

  /// list_only.
  listOnly,
}

/// FloatRateAdvertsEnum mapper.
final Map<String, FloatRateAdvertsEnum> floatRateAdvertsEnumMapper =
    <String, FloatRateAdvertsEnum>{
  "disabled": FloatRateAdvertsEnum.disabled,
  "enabled": FloatRateAdvertsEnum.enabled,
  "list_only": FloatRateAdvertsEnum.listOnly,
};

/// FloatRateAdverts Enum.
enum FloatRateAdvertsEnum {
  /// disabled.
  disabled,

  /// enabled.
  enabled,

  /// list_only.
  listOnly,
}
/// P2p settings model class.
abstract class P2pSettingsModel {
  /// Initializes P2p settings model class .
  const P2pSettingsModel({
    required this.supportedCurrencies,
    required this.reviewPeriod,
    required this.paymentMethodsEnabled,
    required this.orderPaymentPeriod,
    required this.orderDailyLimit,
    required this.maximumOrderAmount,
    required this.maximumAdvertAmount,
    required this.localCurrencies,
    required this.floatRateOffsetLimit,
    required this.floatRateAdverts,
    required this.fixedRateAdverts,
    required this.featureLevel,
    required this.disabled,
    required this.crossBorderAdsEnabled,
    required this.cancellationLimit,
    required this.cancellationGracePeriod,
    required this.cancellationCountPeriod,
    required this.cancellationBlockDuration,
    required this.blockTrade,
    required this.advertsActiveLimit,
    this.advertsArchivePeriod,
    this.counterpartyTermSteps,
    this.fixedRateAdvertsEndDate,
    this.overrideExchangeRate,
  });

  /// List of currencies for which P2P is available
  final List<String> supportedCurrencies;

  /// Time after successful order completion during which reviews can be created, in hours.
  final double reviewPeriod;

  /// Indicates if the payment methods feature is enabled.
  final bool paymentMethodsEnabled;

  /// Time allowed for order payment, in minutes after order creation.
  final int orderPaymentPeriod;

  /// Maximum number of orders a user may create per day.
  final int orderDailyLimit;

  /// Maximum amount of an order, in USD.
  final double maximumOrderAmount;

  /// Maximum amount of an advert, in USD.
  final double maximumAdvertAmount;

  /// Available local currencies for p2p_advert_list request.
  final List<LocalCurrenciesItem> localCurrencies;

  /// Maximum rate offset for floating rate adverts.
  final double floatRateOffsetLimit;

  /// Availability of floating rate adverts.
  final FloatRateAdvertsEnum floatRateAdverts;

  /// Availability of fixed rate adverts.
  final FixedRateAdvertsEnum fixedRateAdverts;

  /// Indicates the availbility of certain backend features.
  final int featureLevel;

  /// When `true`, the P2P service is unavailable.
  final bool disabled;

  /// When `false`, only exchanges in local currency are allowed for P2P advertiser.
  final bool crossBorderAdsEnabled;

  /// A buyer will be temporarily barred after marking this number of cancellations within cancellation_period.
  final int cancellationLimit;

  /// A buyer may cancel an order within this period without negative consequences, in minutes after order creation.
  final int cancellationGracePeriod;

  /// The period within which to count buyer cancellations, in hours.
  final int cancellationCountPeriod;

  /// A buyer will be blocked for this duration after exceeding the cancellation limit, in hours.
  final int cancellationBlockDuration;

  /// Block trading settings
  final BlockTrade blockTrade;

  /// Maximum number of active ads allowed by an advertiser per currency pair and advert type (buy or sell).
  final int advertsActiveLimit;

  /// Adverts will be deactivated if no activity occurs within this period, in days.
  final int? advertsArchivePeriod;

  /// Recommended step values for choosing advert counterparty terms.
  final CounterpartyTermSteps? counterpartyTermSteps;

  /// Date on which fixed rate adverts will be deactivated.
  final String? fixedRateAdvertsEndDate;

  /// Local P2P exchange rate which should be used instead of those obtained from the `exchange_rates` call.
  final String? overrideExchangeRate;
}

/// P2p settings class.
class P2pSettings extends P2pSettingsModel {
  /// Initializes P2p settings class.
  const P2pSettings({
    required int advertsActiveLimit,
    required BlockTrade blockTrade,
    required int cancellationBlockDuration,
    required int cancellationCountPeriod,
    required int cancellationGracePeriod,
    required int cancellationLimit,
    required bool crossBorderAdsEnabled,
    required bool disabled,
    required int featureLevel,
    required FixedRateAdvertsEnum fixedRateAdverts,
    required FloatRateAdvertsEnum floatRateAdverts,
    required double floatRateOffsetLimit,
    required List<LocalCurrenciesItem> localCurrencies,
    required double maximumAdvertAmount,
    required double maximumOrderAmount,
    required int orderDailyLimit,
    required int orderPaymentPeriod,
    required bool paymentMethodsEnabled,
    required double reviewPeriod,
    required List<String> supportedCurrencies,
    int? advertsArchivePeriod,
    CounterpartyTermSteps? counterpartyTermSteps,
    String? fixedRateAdvertsEndDate,
    String? overrideExchangeRate,
  }) : super(
          advertsActiveLimit: advertsActiveLimit,
          blockTrade: blockTrade,
          cancellationBlockDuration: cancellationBlockDuration,
          cancellationCountPeriod: cancellationCountPeriod,
          cancellationGracePeriod: cancellationGracePeriod,
          cancellationLimit: cancellationLimit,
          crossBorderAdsEnabled: crossBorderAdsEnabled,
          disabled: disabled,
          featureLevel: featureLevel,
          fixedRateAdverts: fixedRateAdverts,
          floatRateAdverts: floatRateAdverts,
          floatRateOffsetLimit: floatRateOffsetLimit,
          localCurrencies: localCurrencies,
          maximumAdvertAmount: maximumAdvertAmount,
          maximumOrderAmount: maximumOrderAmount,
          orderDailyLimit: orderDailyLimit,
          orderPaymentPeriod: orderPaymentPeriod,
          paymentMethodsEnabled: paymentMethodsEnabled,
          reviewPeriod: reviewPeriod,
          supportedCurrencies: supportedCurrencies,
          advertsArchivePeriod: advertsArchivePeriod,
          counterpartyTermSteps: counterpartyTermSteps,
          fixedRateAdvertsEndDate: fixedRateAdvertsEndDate,
          overrideExchangeRate: overrideExchangeRate,
        );

  /// Creates an instance from JSON.
  factory P2pSettings.fromJson(Map<String, dynamic> json) => P2pSettings(
        advertsActiveLimit: json['adverts_active_limit'],
        blockTrade: BlockTrade.fromJson(json['block_trade']),
        cancellationBlockDuration: json['cancellation_block_duration'],
        cancellationCountPeriod: json['cancellation_count_period'],
        cancellationGracePeriod: json['cancellation_grace_period'],
        cancellationLimit: json['cancellation_limit'],
        crossBorderAdsEnabled: getBool(json['cross_border_ads_enabled'])!,
        disabled: getBool(json['disabled'])!,
        featureLevel: json['feature_level'],
        fixedRateAdverts:
            fixedRateAdvertsEnumMapper[json['fixed_rate_adverts']]!,
        floatRateAdverts:
            floatRateAdvertsEnumMapper[json['float_rate_adverts']]!,
        floatRateOffsetLimit: getDouble(json['float_rate_offset_limit'])!,
        localCurrencies: List<LocalCurrenciesItem>.from(
          json['local_currencies'].map(
            (dynamic item) => LocalCurrenciesItem.fromJson(item),
          ),
        ),
        maximumAdvertAmount: getDouble(json['maximum_advert_amount'])!,
        maximumOrderAmount: getDouble(json['maximum_order_amount'])!,
        orderDailyLimit: json['order_daily_limit'],
        orderPaymentPeriod: json['order_payment_period'],
        paymentMethodsEnabled: getBool(json['payment_methods_enabled'])!,
        reviewPeriod: getDouble(json['review_period'])!,
        supportedCurrencies: List<String>.from(
          json['supported_currencies'].map(
            (dynamic item) => item,
          ),
        ),
        advertsArchivePeriod: json['adverts_archive_period'],
        counterpartyTermSteps: json['counterparty_term_steps'] == null
            ? null
            : CounterpartyTermSteps.fromJson(json['counterparty_term_steps']),
        fixedRateAdvertsEndDate: json['fixed_rate_adverts_end_date'],
        overrideExchangeRate: json['override_exchange_rate'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['adverts_active_limit'] = advertsActiveLimit;
    resultMap['block_trade'] = blockTrade.toJson();

    resultMap['cancellation_block_duration'] = cancellationBlockDuration;
    resultMap['cancellation_count_period'] = cancellationCountPeriod;
    resultMap['cancellation_grace_period'] = cancellationGracePeriod;
    resultMap['cancellation_limit'] = cancellationLimit;
    resultMap['cross_border_ads_enabled'] = crossBorderAdsEnabled;
    resultMap['disabled'] = disabled;
    resultMap['feature_level'] = featureLevel;
    resultMap['fixed_rate_adverts'] = fixedRateAdvertsEnumMapper.entries
        .firstWhere((MapEntry<String, FixedRateAdvertsEnum> entry) =>
            entry.value == fixedRateAdverts)
        .key;
    resultMap['float_rate_adverts'] = floatRateAdvertsEnumMapper.entries
        .firstWhere((MapEntry<String, FloatRateAdvertsEnum> entry) =>
            entry.value == floatRateAdverts)
        .key;
    resultMap['float_rate_offset_limit'] = floatRateOffsetLimit;
    resultMap['local_currencies'] = localCurrencies
        .map<dynamic>(
          (LocalCurrenciesItem item) => item.toJson(),
        )
        .toList();

    resultMap['maximum_advert_amount'] = maximumAdvertAmount;
    resultMap['maximum_order_amount'] = maximumOrderAmount;
    resultMap['order_daily_limit'] = orderDailyLimit;
    resultMap['order_payment_period'] = orderPaymentPeriod;
    resultMap['payment_methods_enabled'] = paymentMethodsEnabled;
    resultMap['review_period'] = reviewPeriod;
    resultMap['supported_currencies'] = supportedCurrencies
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    resultMap['adverts_archive_period'] = advertsArchivePeriod;
    if (counterpartyTermSteps != null) {
      resultMap['counterparty_term_steps'] = counterpartyTermSteps!.toJson();
    }
    resultMap['fixed_rate_adverts_end_date'] = fixedRateAdvertsEndDate;
    resultMap['override_exchange_rate'] = overrideExchangeRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pSettings copyWith({
    int? advertsActiveLimit,
    BlockTrade? blockTrade,
    int? cancellationBlockDuration,
    int? cancellationCountPeriod,
    int? cancellationGracePeriod,
    int? cancellationLimit,
    bool? crossBorderAdsEnabled,
    bool? disabled,
    int? featureLevel,
    FixedRateAdvertsEnum? fixedRateAdverts,
    FloatRateAdvertsEnum? floatRateAdverts,
    double? floatRateOffsetLimit,
    List<LocalCurrenciesItem>? localCurrencies,
    double? maximumAdvertAmount,
    double? maximumOrderAmount,
    int? orderDailyLimit,
    int? orderPaymentPeriod,
    bool? paymentMethodsEnabled,
    double? reviewPeriod,
    List<String>? supportedCurrencies,
    int? advertsArchivePeriod,
    CounterpartyTermSteps? counterpartyTermSteps,
    String? fixedRateAdvertsEndDate,
    String? overrideExchangeRate,
  }) =>
      P2pSettings(
        advertsActiveLimit: advertsActiveLimit ?? this.advertsActiveLimit,
        blockTrade: blockTrade ?? this.blockTrade,
        cancellationBlockDuration:
            cancellationBlockDuration ?? this.cancellationBlockDuration,
        cancellationCountPeriod:
            cancellationCountPeriod ?? this.cancellationCountPeriod,
        cancellationGracePeriod:
            cancellationGracePeriod ?? this.cancellationGracePeriod,
        cancellationLimit: cancellationLimit ?? this.cancellationLimit,
        crossBorderAdsEnabled:
            crossBorderAdsEnabled ?? this.crossBorderAdsEnabled,
        disabled: disabled ?? this.disabled,
        featureLevel: featureLevel ?? this.featureLevel,
        fixedRateAdverts: fixedRateAdverts ?? this.fixedRateAdverts,
        floatRateAdverts: floatRateAdverts ?? this.floatRateAdverts,
        floatRateOffsetLimit: floatRateOffsetLimit ?? this.floatRateOffsetLimit,
        localCurrencies: localCurrencies ?? this.localCurrencies,
        maximumAdvertAmount: maximumAdvertAmount ?? this.maximumAdvertAmount,
        maximumOrderAmount: maximumOrderAmount ?? this.maximumOrderAmount,
        orderDailyLimit: orderDailyLimit ?? this.orderDailyLimit,
        orderPaymentPeriod: orderPaymentPeriod ?? this.orderPaymentPeriod,
        paymentMethodsEnabled:
            paymentMethodsEnabled ?? this.paymentMethodsEnabled,
        reviewPeriod: reviewPeriod ?? this.reviewPeriod,
        supportedCurrencies: supportedCurrencies ?? this.supportedCurrencies,
        advertsArchivePeriod: advertsArchivePeriod ?? this.advertsArchivePeriod,
        counterpartyTermSteps:
            counterpartyTermSteps ?? this.counterpartyTermSteps,
        fixedRateAdvertsEndDate:
            fixedRateAdvertsEndDate ?? this.fixedRateAdvertsEndDate,
        overrideExchangeRate: overrideExchangeRate ?? this.overrideExchangeRate,
      );
}
/// Block trade model class.
abstract class BlockTradeModel {
  /// Initializes Block trade model class .
  const BlockTradeModel({
    this.disabled,
    this.maximumAdvertAmount,
  });

  /// When `true`, Block trading is unavailable.
  final bool? disabled;

  /// Maximum amount of a block trade advert, in USD.
  final double? maximumAdvertAmount;
}

/// Block trade class.
class BlockTrade extends BlockTradeModel {
  /// Initializes Block trade class.
  const BlockTrade({
    bool? disabled,
    double? maximumAdvertAmount,
  }) : super(
          disabled: disabled,
          maximumAdvertAmount: maximumAdvertAmount,
        );

  /// Creates an instance from JSON.
  factory BlockTrade.fromJson(Map<String, dynamic> json) => BlockTrade(
        disabled: getBool(json['disabled']),
        maximumAdvertAmount: getDouble(json['maximum_advert_amount']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['disabled'] = disabled;
    resultMap['maximum_advert_amount'] = maximumAdvertAmount;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  BlockTrade copyWith({
    bool? disabled,
    double? maximumAdvertAmount,
  }) =>
      BlockTrade(
        disabled: disabled ?? this.disabled,
        maximumAdvertAmount: maximumAdvertAmount ?? this.maximumAdvertAmount,
      );
}
/// Local currencies item model class.
abstract class LocalCurrenciesItemModel {
  /// Initializes Local currencies item model class .
  const LocalCurrenciesItemModel({
    required this.symbol,
    required this.hasAdverts,
    required this.displayName,
    this.isDefault,
  });

  /// Local currency symbol
  final String symbol;

  /// Indicates that there are adverts available for this currency.
  final bool hasAdverts;

  /// Local currency name
  final String displayName;

  /// Indicates that this is local currency for the current country.
  final int? isDefault;
}

/// Local currencies item class.
class LocalCurrenciesItem extends LocalCurrenciesItemModel {
  /// Initializes Local currencies item class.
  const LocalCurrenciesItem({
    required String displayName,
    required bool hasAdverts,
    required String symbol,
    int? isDefault,
  }) : super(
          displayName: displayName,
          hasAdverts: hasAdverts,
          symbol: symbol,
          isDefault: isDefault,
        );

  /// Creates an instance from JSON.
  factory LocalCurrenciesItem.fromJson(Map<String, dynamic> json) =>
      LocalCurrenciesItem(
        displayName: json['display_name'],
        hasAdverts: getBool(json['has_adverts'])!,
        symbol: json['symbol'],
        isDefault: json['is_default'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['has_adverts'] = hasAdverts;
    resultMap['symbol'] = symbol;
    resultMap['is_default'] = isDefault;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LocalCurrenciesItem copyWith({
    String? displayName,
    bool? hasAdverts,
    String? symbol,
    int? isDefault,
  }) =>
      LocalCurrenciesItem(
        displayName: displayName ?? this.displayName,
        hasAdverts: hasAdverts ?? this.hasAdverts,
        symbol: symbol ?? this.symbol,
        isDefault: isDefault ?? this.isDefault,
      );
}
/// Counterparty term steps model class.
abstract class CounterpartyTermStepsModel {
  /// Initializes Counterparty term steps model class .
  const CounterpartyTermStepsModel({
    required this.rating,
    required this.joinDays,
    required this.completionRate,
  });

  /// Values for minimum average rating.
  final List<double> rating;

  /// Values for minimum joined days.
  final List<int> joinDays;

  /// Values for minimum 30 day completion rate.
  final List<double> completionRate;
}

/// Counterparty term steps class.
class CounterpartyTermSteps extends CounterpartyTermStepsModel {
  /// Initializes Counterparty term steps class.
  const CounterpartyTermSteps({
    required List<double> completionRate,
    required List<int> joinDays,
    required List<double> rating,
  }) : super(
          completionRate: completionRate,
          joinDays: joinDays,
          rating: rating,
        );

  /// Creates an instance from JSON.
  factory CounterpartyTermSteps.fromJson(Map<String, dynamic> json) =>
      CounterpartyTermSteps(
        completionRate: List<double>.from(
          json['completion_rate'].map(
            (dynamic item) => getDouble(item),
          ),
        ),
        joinDays: List<int>.from(
          json['join_days'].map(
            (dynamic item) => item,
          ),
        ),
        rating: List<double>.from(
          json['rating'].map(
            (dynamic item) => getDouble(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['completion_rate'] = completionRate
        .map<dynamic>(
          (double item) => item,
        )
        .toList();

    resultMap['join_days'] = joinDays
        .map<dynamic>(
          (int item) => item,
        )
        .toList();

    resultMap['rating'] = rating
        .map<dynamic>(
          (double item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CounterpartyTermSteps copyWith({
    List<double>? completionRate,
    List<int>? joinDays,
    List<double>? rating,
  }) =>
      CounterpartyTermSteps(
        completionRate: completionRate ?? this.completionRate,
        joinDays: joinDays ?? this.joinDays,
        rating: rating ?? this.rating,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
