// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Crypto config response model class.
abstract class CryptoConfigResponseModel extends Equatable {
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
    CryptoConfig? cryptoConfig,
  }) : super(
          cryptoConfig: cryptoConfig,
        );

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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Crypto config model class.
abstract class CryptoConfigModel extends Equatable {
  /// Initializes Crypto config model class .
  const CryptoConfigModel({
    required this.currenciesConfig,
  });

  /// Provides minimum withdrawal for all cryptocurrencies in USD
  final Map<String, CurrenciesConfigProperty> currenciesConfig;
}

/// Crypto config class.
class CryptoConfig extends CryptoConfigModel {
  /// Initializes Crypto config class.
  const CryptoConfig({
    required Map<String, CurrenciesConfigProperty> currenciesConfig,
  }) : super(
          currenciesConfig: currenciesConfig,
        );

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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Currencies config property model class.
abstract class CurrenciesConfigPropertyModel extends Equatable {
  /// Initializes Currencies config property model class .
  const CurrenciesConfigPropertyModel({
    this.minimumWithdrawal,
  });

  /// Minimum withdrawal for the cryptocurrency in USD.
  final double? minimumWithdrawal;
}

/// Currencies config property class.
class CurrenciesConfigProperty extends CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property class.
  const CurrenciesConfigProperty({
    double? minimumWithdrawal,
  }) : super(
          minimumWithdrawal: minimumWithdrawal,
        );

  /// Creates an instance from JSON.
  factory CurrenciesConfigProperty.fromJson(Map<String, dynamic> json) =>
      CurrenciesConfigProperty(
        minimumWithdrawal: getDouble(json['minimum_withdrawal']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['minimum_withdrawal'] = minimumWithdrawal;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrenciesConfigProperty copyWith({
    double? minimumWithdrawal,
  }) =>
      CurrenciesConfigProperty(
        minimumWithdrawal: minimumWithdrawal ?? this.minimumWithdrawal,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
