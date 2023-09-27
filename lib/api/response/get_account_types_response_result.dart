// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Get account types response model class.
abstract class GetAccountTypesResponseModel {
  /// Initializes Get account types response model class .
  const GetAccountTypesResponseModel({
    this.getAccountTypes,
  });

  /// Returns accounts that are available to create or link to
  final GetAccountTypes? getAccountTypes;
}

/// Get account types response class.
class GetAccountTypesResponse extends GetAccountTypesResponseModel {
  /// Initializes Get account types response class.
  const GetAccountTypesResponse({
    super.getAccountTypes,
  });

  /// Creates an instance from JSON.
  factory GetAccountTypesResponse.fromJson(
    dynamic getAccountTypesJson,
  ) =>
      GetAccountTypesResponse(
        getAccountTypes: getAccountTypesJson == null
            ? null
            : GetAccountTypes.fromJson(getAccountTypesJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getAccountTypes != null) {
      resultMap['get_account_types'] = getAccountTypes!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAccountTypesResponse copyWith({
    GetAccountTypes? getAccountTypes,
  }) =>
      GetAccountTypesResponse(
        getAccountTypes: getAccountTypes ?? this.getAccountTypes,
      );
}
/// Get account types model class.
abstract class GetAccountTypesModel {
  /// Initializes Get account types model class .
  const GetAccountTypesModel({
    required this.wallet,
    required this.trading,
  });

  /// Wallet accounts types that are available to create or link to
  final Map<String, WalletProperty> wallet;

  /// Trading account types that are available to create or link to
  final Map<String, TradingProperty> trading;
}

/// Get account types class.
class GetAccountTypes extends GetAccountTypesModel {
  /// Initializes Get account types class.
  const GetAccountTypes({
    required super.trading,
    required super.wallet,
  });

  /// Creates an instance from JSON.
  factory GetAccountTypes.fromJson(Map<String, dynamic> json) =>
      GetAccountTypes(
        trading: Map<String, TradingProperty>.fromEntries(json['trading']
            .entries
            .map<MapEntry<String, TradingProperty>>(
                (MapEntry<String, dynamic> entry) =>
                    MapEntry<String, TradingProperty>(
                        entry.key, TradingProperty.fromJson(entry.value)))),
        wallet: Map<String, WalletProperty>.fromEntries(json['wallet']
            .entries
            .map<MapEntry<String, WalletProperty>>(
                (MapEntry<String, dynamic> entry) =>
                    MapEntry<String, WalletProperty>(
                        entry.key, WalletProperty.fromJson(entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading'] = trading;
    resultMap['wallet'] = wallet;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAccountTypes copyWith({
    Map<String, TradingProperty>? trading,
    Map<String, WalletProperty>? wallet,
  }) =>
      GetAccountTypes(
        trading: trading ?? this.trading,
        wallet: wallet ?? this.wallet,
      );
}
/// Trading property model class.
abstract class TradingPropertyModel {
  /// Initializes Trading property model class .
  const TradingPropertyModel({
    required this.linkableWalletTypes,
    required this.linkableToDifferentCurrency,
    required this.allowedWalletCurrencies,
  });

  /// Wallet types that this trading account can be linked to.
  final List<String> linkableWalletTypes;

  /// Can this trading account linked to another currency after opening
  final bool linkableToDifferentCurrency;

  /// Wallet currencies allowed for this trading account
  final List<String> allowedWalletCurrencies;
}

/// Trading property class.
class TradingProperty extends TradingPropertyModel {
  /// Initializes Trading property class.
  const TradingProperty({
    required super.allowedWalletCurrencies,
    required super.linkableToDifferentCurrency,
    required super.linkableWalletTypes,
  });

  /// Creates an instance from JSON.
  factory TradingProperty.fromJson(Map<String, dynamic> json) =>
      TradingProperty(
        allowedWalletCurrencies: List<String>.from(
          json['allowed_wallet_currencies'].map(
            (dynamic item) => item,
          ),
        ),
        linkableToDifferentCurrency:
            getBool(json['linkable_to_different_currency'])!,
        linkableWalletTypes: List<String>.from(
          json['linkable_wallet_types'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['allowed_wallet_currencies'] = allowedWalletCurrencies
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    resultMap['linkable_to_different_currency'] = linkableToDifferentCurrency;
    resultMap['linkable_wallet_types'] = linkableWalletTypes
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingProperty copyWith({
    List<String>? allowedWalletCurrencies,
    bool? linkableToDifferentCurrency,
    List<String>? linkableWalletTypes,
  }) =>
      TradingProperty(
        allowedWalletCurrencies:
            allowedWalletCurrencies ?? this.allowedWalletCurrencies,
        linkableToDifferentCurrency:
            linkableToDifferentCurrency ?? this.linkableToDifferentCurrency,
        linkableWalletTypes: linkableWalletTypes ?? this.linkableWalletTypes,
      );
}
/// Wallet property model class.
abstract class WalletPropertyModel {
  /// Initializes Wallet property model class .
  const WalletPropertyModel({
    required this.currencies,
  });

  /// Allowed currencies for creating accounts of this type; used or disallowed currencies are not listed.
  final List<String> currencies;
}

/// Wallet property class.
class WalletProperty extends WalletPropertyModel {
  /// Initializes Wallet property class.
  const WalletProperty({
    required super.currencies,
  });

  /// Creates an instance from JSON.
  factory WalletProperty.fromJson(Map<String, dynamic> json) => WalletProperty(
        currencies: List<String>.from(
          json['currencies'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currencies'] = currencies
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WalletProperty copyWith({
    List<String>? currencies,
  }) =>
      WalletProperty(
        currencies: currencies ?? this.currencies,
      );
}
