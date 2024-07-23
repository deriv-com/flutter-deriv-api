// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Website config response model class.
abstract class WebsiteConfigResponseModel {
  /// Initializes Website config response model class .
  const WebsiteConfigResponseModel({
    this.websiteConfig,
    this.subscription,
  });

  /// Server status and other information regarding general settings
  final WebsiteConfig? websiteConfig;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Website config response class.
class WebsiteConfigResponse extends WebsiteConfigResponseModel {
  /// Initializes Website config response class.
  const WebsiteConfigResponse({
    super.websiteConfig,
    super.subscription,
  });

  /// Creates an instance from JSON.
  factory WebsiteConfigResponse.fromJson(
    dynamic websiteConfigJson,
    dynamic subscriptionJson,
  ) =>
      WebsiteConfigResponse(
        websiteConfig: websiteConfigJson == null
            ? null
            : WebsiteConfig.fromJson(websiteConfigJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (websiteConfig != null) {
      resultMap['website_config'] = websiteConfig!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WebsiteConfigResponse copyWith({
    WebsiteConfig? websiteConfig,
    Subscription? subscription,
  }) =>
      WebsiteConfigResponse(
        websiteConfig: websiteConfig ?? this.websiteConfig,
        subscription: subscription ?? this.subscription,
      );
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "fiat": TypeEnum.fiat,
  "crypto": TypeEnum.crypto,
};

/// Type Enum.
enum TypeEnum {
  /// fiat.
  fiat,

  /// crypto.
  crypto,
}

/// Website config model class.
abstract class WebsiteConfigModel {
  /// Initializes Website config model class .
  const WebsiteConfigModel({
    required this.currenciesConfig,
    this.featureFlags,
    this.paymentAgents,
    this.supportedLanguages,
    this.termsConditionsVersion,
  });

  /// Available currencies and their information
  final Map<String, CurrenciesConfigProperty> currenciesConfig;

  /// Feature flags related to the website/server for various features and options:
  ///  - 'signup_with_optional_email_verification': Allow signup with optional email verification.
  final List<String>? featureFlags;

  /// Payments Agents system settings.
  final PaymentAgents? paymentAgents;

  /// Provides codes for languages supported.
  final List<String>? supportedLanguages;

  /// Latest terms and conditions version.
  final String? termsConditionsVersion;
}

/// Website config class.
class WebsiteConfig extends WebsiteConfigModel {
  /// Initializes Website config class.
  const WebsiteConfig({
    required super.currenciesConfig,
    super.featureFlags,
    super.paymentAgents,
    super.supportedLanguages,
    super.termsConditionsVersion,
  });

  /// Creates an instance from JSON.
  factory WebsiteConfig.fromJson(Map<String, dynamic> json) => WebsiteConfig(
        currenciesConfig: Map<String, CurrenciesConfigProperty>.fromEntries(
            json['currencies_config']
                .entries
                .map<MapEntry<String, CurrenciesConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CurrenciesConfigProperty>(entry.key,
                            CurrenciesConfigProperty.fromJson(entry.value)))),
        featureFlags: json['feature_flags'] == null
            ? null
            : List<String>.from(
                json['feature_flags']?.map(
                  (dynamic item) => item,
                ),
              ),
        paymentAgents: json['payment_agents'] == null
            ? null
            : PaymentAgents.fromJson(json['payment_agents']),
        supportedLanguages: json['supported_languages'] == null
            ? null
            : List<String>.from(
                json['supported_languages']?.map(
                  (dynamic item) => item,
                ),
              ),
        termsConditionsVersion: json['terms_conditions_version'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies_config'] = currenciesConfig;
    if (featureFlags != null) {
      resultMap['feature_flags'] = featureFlags!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (paymentAgents != null) {
      resultMap['payment_agents'] = paymentAgents!.toJson();
    }
    if (supportedLanguages != null) {
      resultMap['supported_languages'] = supportedLanguages!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['terms_conditions_version'] = termsConditionsVersion;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WebsiteConfig copyWith({
    Map<String, CurrenciesConfigProperty>? currenciesConfig,
    List<String>? featureFlags,
    PaymentAgents? paymentAgents,
    List<String>? supportedLanguages,
    String? termsConditionsVersion,
  }) =>
      WebsiteConfig(
        currenciesConfig: currenciesConfig ?? this.currenciesConfig,
        featureFlags: featureFlags ?? this.featureFlags,
        paymentAgents: paymentAgents ?? this.paymentAgents,
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        termsConditionsVersion:
            termsConditionsVersion ?? this.termsConditionsVersion,
      );
}

/// Currencies config property model class.
abstract class CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property model class .
  const CurrenciesConfigPropertyModel({
    required this.type,
    required this.transferBetweenAccounts,
    required this.stakeDefault,
    required this.isWithdrawalSuspended,
    required this.isSuspended,
    required this.isDepositSuspended,
    required this.fractionalDigits,
    this.name,
  });

  /// Type of the currency.
  final TypeEnum type;

  /// Fees and range of allowed amount for transfer between accounts with different types of currencies.
  final TransferBetweenAccounts transferBetweenAccounts;

  /// Default stake value for the currency.
  final double stakeDefault;

  /// Current status for payment withdrawal for the currency
  final double isWithdrawalSuspended;

  /// Current status for the currency
  final double isSuspended;

  /// Current status for payment deposit for the currency
  final double isDepositSuspended;

  /// Number of fractional digits.
  final double fractionalDigits;

  /// Name of the currency.
  final String? name;
}

/// Currencies config property class.
class CurrenciesConfigProperty extends CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property class.
  const CurrenciesConfigProperty({
    required super.fractionalDigits,
    required super.isDepositSuspended,
    required super.isSuspended,
    required super.isWithdrawalSuspended,
    required super.stakeDefault,
    required super.transferBetweenAccounts,
    required super.type,
    super.name,
  });

  /// Creates an instance from JSON.
  factory CurrenciesConfigProperty.fromJson(Map<String, dynamic> json) =>
      CurrenciesConfigProperty(
        fractionalDigits: getDouble(json['fractional_digits'])!,
        isDepositSuspended: getDouble(json['is_deposit_suspended'])!,
        isSuspended: getDouble(json['is_suspended'])!,
        isWithdrawalSuspended: getDouble(json['is_withdrawal_suspended'])!,
        stakeDefault: getDouble(json['stake_default'])!,
        transferBetweenAccounts:
            TransferBetweenAccounts.fromJson(json['transfer_between_accounts']),
        type: typeEnumMapper[json['type']]!,
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fractional_digits'] = fractionalDigits;
    resultMap['is_deposit_suspended'] = isDepositSuspended;
    resultMap['is_suspended'] = isSuspended;
    resultMap['is_withdrawal_suspended'] = isWithdrawalSuspended;
    resultMap['stake_default'] = stakeDefault;
    resultMap['transfer_between_accounts'] = transferBetweenAccounts.toJson();

    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrenciesConfigProperty copyWith({
    double? fractionalDigits,
    double? isDepositSuspended,
    double? isSuspended,
    double? isWithdrawalSuspended,
    double? stakeDefault,
    TransferBetweenAccounts? transferBetweenAccounts,
    TypeEnum? type,
    String? name,
  }) =>
      CurrenciesConfigProperty(
        fractionalDigits: fractionalDigits ?? this.fractionalDigits,
        isDepositSuspended: isDepositSuspended ?? this.isDepositSuspended,
        isSuspended: isSuspended ?? this.isSuspended,
        isWithdrawalSuspended:
            isWithdrawalSuspended ?? this.isWithdrawalSuspended,
        stakeDefault: stakeDefault ?? this.stakeDefault,
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        type: type ?? this.type,
        name: name ?? this.name,
      );
}

/// Transfer between accounts model class.
abstract class TransferBetweenAccountsModel {
  /// Initializes Transfer between accounts model class .
  const TransferBetweenAccountsModel({
    required this.limits,
    required this.fees,
    this.limitsCtrader,
    this.limitsDerivez,
    this.limitsDxtrade,
    this.limitsMt5,
  });

  ///
  final Limits limits;

  /// The fee that applies for transfer between accounts with different types of currencies.
  final Map<String, double> fees;

  /// Range of allowed amount for transfer between ctrader accounts.
  final Map<String, dynamic>? limitsCtrader;

  /// Range of allowed amount for transfer between derivez accounts.
  final Map<String, dynamic>? limitsDerivez;

  /// Range of allowed amount for transfer between dxtrade accounts.
  final Map<String, dynamic>? limitsDxtrade;

  /// Range of allowed amount for transfer between mt5 accounts.
  final Map<String, dynamic>? limitsMt5;
}

/// Transfer between accounts class.
class TransferBetweenAccounts extends TransferBetweenAccountsModel {
  /// Initializes Transfer between accounts class.
  const TransferBetweenAccounts({
    required super.fees,
    required super.limits,
    super.limitsCtrader,
    super.limitsDerivez,
    super.limitsDxtrade,
    super.limitsMt5,
  });

  /// Creates an instance from JSON.
  factory TransferBetweenAccounts.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccounts(
        fees: Map<String, double>.fromEntries(json['fees']
            .entries
            .map<MapEntry<String, double>>((MapEntry<String, dynamic> entry) =>
                MapEntry<String, double>(entry.key, getDouble(entry.value)!))),
        limits: Limits.fromJson(json['limits']),
        limitsCtrader: json['limits_ctrader'],
        limitsDerivez: json['limits_derivez'],
        limitsDxtrade: json['limits_dxtrade'],
        limitsMt5: json['limits_mt5'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fees'] = fees;
    resultMap['limits'] = limits.toJson();

    resultMap['limits_ctrader'] = limitsCtrader;
    resultMap['limits_derivez'] = limitsDerivez;
    resultMap['limits_dxtrade'] = limitsDxtrade;
    resultMap['limits_mt5'] = limitsMt5;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TransferBetweenAccounts copyWith({
    Map<String, double>? fees,
    Limits? limits,
    Map<String, dynamic>? limitsCtrader,
    Map<String, dynamic>? limitsDerivez,
    Map<String, dynamic>? limitsDxtrade,
    Map<String, dynamic>? limitsMt5,
  }) =>
      TransferBetweenAccounts(
        fees: fees ?? this.fees,
        limits: limits ?? this.limits,
        limitsCtrader: limitsCtrader ?? this.limitsCtrader,
        limitsDerivez: limitsDerivez ?? this.limitsDerivez,
        limitsDxtrade: limitsDxtrade ?? this.limitsDxtrade,
        limitsMt5: limitsMt5 ?? this.limitsMt5,
      );
}

/// Limits model class.
abstract class LimitsModel {
  /// Initializes Limits model class .
  const LimitsModel({
    required this.min,
    this.max,
  });

  /// Minimum allowed amount for transfer between accounts with different types of currencies.
  final double min;

  /// Maximum allowed amount for transfer between accounts with different types of currencies.
  final double? max;
}

/// Limits class.
class Limits extends LimitsModel {
  /// Initializes Limits class.
  const Limits({
    required super.min,
    super.max,
  });

  /// Creates an instance from JSON.
  factory Limits.fromJson(Map<String, dynamic> json) => Limits(
        min: getDouble(json['min'])!,
        max: getDouble(json['max']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['min'] = min;
    resultMap['max'] = max;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Limits copyWith({
    double? min,
    double? max,
  }) =>
      Limits(
        min: min ?? this.min,
        max: max ?? this.max,
      );
}

/// Payment agents model class.
abstract class PaymentAgentsModel {
  /// Initializes Payment agents model class .
  const PaymentAgentsModel({
    required this.initialDepositPerCountry,
  });

  /// Initial deposit requirement per country.
  final Map<String, double> initialDepositPerCountry;
}

/// Payment agents class.
class PaymentAgents extends PaymentAgentsModel {
  /// Initializes Payment agents class.
  const PaymentAgents({
    required super.initialDepositPerCountry,
  });

  /// Creates an instance from JSON.
  factory PaymentAgents.fromJson(Map<String, dynamic> json) => PaymentAgents(
        initialDepositPerCountry: Map<String, double>.fromEntries(json[
                'initial_deposit_per_country']
            .entries
            .map<MapEntry<String, double>>((MapEntry<String, dynamic> entry) =>
                MapEntry<String, double>(entry.key, getDouble(entry.value)!))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['initial_deposit_per_country'] = initialDepositPerCountry;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentAgents copyWith({
    Map<String, double>? initialDepositPerCountry,
  }) =>
      PaymentAgents(
        initialDepositPerCountry:
            initialDepositPerCountry ?? this.initialDepositPerCountry,
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
    required super.id,
  });

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
