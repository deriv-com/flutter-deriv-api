// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Crypto config response model class.
abstract class CryptoConfigResponseModel {
  /// Initializes Crypto config response model class .
  const CryptoConfigResponseModel({
    this.cryptoConfig,
  });

  /// Provides cryptocurrencies configuration.
  final CryptoConfig? cryptoConfig;
}

/// Crypto config response class.
class CryptoConfigResponse extends CryptoConfigResponseModel {
  /// Initializes Crypto config response class.
  const CryptoConfigResponse({
    super.cryptoConfig,
  });

  /// Creates an instance from JSON.
  factory CryptoConfigResponse.fromJson(
    dynamic cryptoConfigJson,
  ) =>
      CryptoConfigResponse(
        cryptoConfig: cryptoConfigJson == null
            ? null
            : CryptoConfig.fromJson(cryptoConfigJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (cryptoConfig != null) {
      resultMap['crypto_config'] = cryptoConfig!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoConfigResponse copyWith({
    CryptoConfig? cryptoConfig,
  }) =>
      CryptoConfigResponse(
        cryptoConfig: cryptoConfig ?? this.cryptoConfig,
      );
}
/// Crypto config model class.
abstract class CryptoConfigModel {
  /// Initializes Crypto config model class .
  const CryptoConfigModel({
    required this.currenciesConfig,
  });

  /// Currency configuration including limitiations for each crypto currency.
  final Map<String, CurrenciesConfigProperty> currenciesConfig;
}

/// Crypto config class.
class CryptoConfig extends CryptoConfigModel {
  /// Initializes Crypto config class.
  const CryptoConfig({
    required super.currenciesConfig,
  });

  /// Creates an instance from JSON.
  factory CryptoConfig.fromJson(Map<String, dynamic> json) => CryptoConfig(
        currenciesConfig: Map<String, CurrenciesConfigProperty>.fromEntries(
            json['currencies_config']
                .entries
                .map<MapEntry<String, CurrenciesConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CurrenciesConfigProperty>(entry.key,
                            CurrenciesConfigProperty.fromJson(entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies_config'] = currenciesConfig;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoConfig copyWith({
    Map<String, CurrenciesConfigProperty>? currenciesConfig,
  }) =>
      CryptoConfig(
        currenciesConfig: currenciesConfig ?? this.currenciesConfig,
      );
}
/// Currencies config property model class.
abstract class CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property model class .
  const CurrenciesConfigPropertyModel({
    this.minimumDeposit,
    this.minimumWithdrawal,
  });

  /// Minimum deposit amount in corresponding cryptocurrency value.
  final double? minimumDeposit;

  /// Minimum withdrawal for the cryptocurrency in USD.
  final double? minimumWithdrawal;
}

/// Currencies config property class.
class CurrenciesConfigProperty extends CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property class.
  const CurrenciesConfigProperty({
    super.minimumDeposit,
    super.minimumWithdrawal,
  });

  /// Creates an instance from JSON.
  factory CurrenciesConfigProperty.fromJson(Map<String, dynamic> json) =>
      CurrenciesConfigProperty(
        minimumDeposit: getDouble(json['minimum_deposit']),
        minimumWithdrawal: getDouble(json['minimum_withdrawal']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['minimum_deposit'] = minimumDeposit;
    resultMap['minimum_withdrawal'] = minimumWithdrawal;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrenciesConfigProperty copyWith({
    double? minimumDeposit,
    double? minimumWithdrawal,
  }) =>
      CurrenciesConfigProperty(
        minimumDeposit: minimumDeposit ?? this.minimumDeposit,
        minimumWithdrawal: minimumWithdrawal ?? this.minimumWithdrawal,
      );
}
