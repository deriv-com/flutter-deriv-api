// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform product listing response model class.
abstract class TradingPlatformProductListingResponseModel extends Equatable {
  /// Initializes Trading platform product listing response model class .
  const TradingPlatformProductListingResponseModel({
    this.tradingPlatformProductListing,
  });

  /// Containing Trading product objects.
  final Map<String, TradingPlatformProductListingProperty>?
      tradingPlatformProductListing;
}

/// Trading platform product listing response class.
class TradingPlatformProductListingResponse
    extends TradingPlatformProductListingResponseModel {
  /// Initializes Trading platform product listing response class.
  const TradingPlatformProductListingResponse({
    Map<String, TradingPlatformProductListingProperty>?
        tradingPlatformProductListing,
  }) : super(
          tradingPlatformProductListing: tradingPlatformProductListing,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformProductListingResponse.fromJson(
    dynamic tradingPlatformProductListingJson,
  ) =>
      TradingPlatformProductListingResponse(
        tradingPlatformProductListing: tradingPlatformProductListingJson == null
            ? null
            : Map<String, TradingPlatformProductListingProperty>.fromEntries(
                tradingPlatformProductListingJson.entries.map<
                        MapEntry<String, TradingPlatformProductListingProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, TradingPlatformProductListingProperty>(
                            entry.key,
                            TradingPlatformProductListingProperty.fromJson(
                                entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading_platform_product_listing'] =
        tradingPlatformProductListing;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformProductListingResponse copyWith({
    Map<String, TradingPlatformProductListingProperty>?
        tradingPlatformProductListing,
  }) =>
      TradingPlatformProductListingResponse(
        tradingPlatformProductListing:
            tradingPlatformProductListing ?? this.tradingPlatformProductListing,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Trading platform product listing property model class.
abstract class TradingPlatformProductListingPropertyModel extends Equatable {
  /// Initializes Trading platform product listing property model class .
  const TradingPlatformProductListingPropertyModel({
    this.availableMarkets,
    this.availableTradeTypes,
    this.name,
    this.productList,
  });

  /// Available markets for country.
  final List<String>? availableMarkets;

  /// Available trade types for country.
  final List<String>? availableTradeTypes;

  /// Name of trading platform.
  final String? name;

  /// Available product for the Trading Platform.
  final List<ProductListItem>? productList;
}

/// Trading platform product listing property class.
class TradingPlatformProductListingProperty
    extends TradingPlatformProductListingPropertyModel {
  /// Initializes Trading platform product listing property class.
  const TradingPlatformProductListingProperty({
    List<String>? availableMarkets,
    List<String>? availableTradeTypes,
    String? name,
    List<ProductListItem>? productList,
  }) : super(
          availableMarkets: availableMarkets,
          availableTradeTypes: availableTradeTypes,
          name: name,
          productList: productList,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformProductListingProperty.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformProductListingProperty(
        availableMarkets: json['available_markets'] == null
            ? null
            : List<String>.from(
                json['available_markets']?.map(
                  (dynamic item) => item,
                ),
              ),
        availableTradeTypes: json['available_trade_types'] == null
            ? null
            : List<String>.from(
                json['available_trade_types']?.map(
                  (dynamic item) => item,
                ),
              ),
        name: json['name'],
        productList: json['product_list'] == null
            ? null
            : List<ProductListItem>.from(
                json['product_list']?.map(
                  (dynamic item) => ProductListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (availableMarkets != null) {
      resultMap['available_markets'] = availableMarkets!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (availableTradeTypes != null) {
      resultMap['available_trade_types'] = availableTradeTypes!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['name'] = name;
    if (productList != null) {
      resultMap['product_list'] = productList!
          .map<dynamic>(
            (ProductListItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformProductListingProperty copyWith({
    List<String>? availableMarkets,
    List<String>? availableTradeTypes,
    String? name,
    List<ProductListItem>? productList,
  }) =>
      TradingPlatformProductListingProperty(
        availableMarkets: availableMarkets ?? this.availableMarkets,
        availableTradeTypes: availableTradeTypes ?? this.availableTradeTypes,
        name: name ?? this.name,
        productList: productList ?? this.productList,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Product list item model class.
abstract class ProductListItemModel extends Equatable {
  /// Initializes Product list item model class .
  const ProductListItemModel({
    this.availableAccountTypes,
    this.availableTradeTypes,
    this.market,
    this.submarket,
    this.symbol,
  });

  /// Available account types for this asset symbol.
  final List<String>? availableAccountTypes;

  /// Available trade types for this asset symbol.
  final List<String>? availableTradeTypes;

  /// Information for a market.
  final Market? market;

  /// Information for submarket.
  final Submarket? submarket;

  /// Information for underlying symbol.
  final Symbol? symbol;
}

/// Product list item class.
class ProductListItem extends ProductListItemModel {
  /// Initializes Product list item class.
  const ProductListItem({
    List<String>? availableAccountTypes,
    List<String>? availableTradeTypes,
    Market? market,
    Submarket? submarket,
    Symbol? symbol,
  }) : super(
          availableAccountTypes: availableAccountTypes,
          availableTradeTypes: availableTradeTypes,
          market: market,
          submarket: submarket,
          symbol: symbol,
        );

  /// Creates an instance from JSON.
  factory ProductListItem.fromJson(Map<String, dynamic> json) =>
      ProductListItem(
        availableAccountTypes: json['available_account_types'] == null
            ? null
            : List<String>.from(
                json['available_account_types']?.map(
                  (dynamic item) => item,
                ),
              ),
        availableTradeTypes: json['available_trade_types'] == null
            ? null
            : List<String>.from(
                json['available_trade_types']?.map(
                  (dynamic item) => item,
                ),
              ),
        market: json['market'] == null ? null : Market.fromJson(json['market']),
        submarket: json['submarket'] == null
            ? null
            : Submarket.fromJson(json['submarket']),
        symbol: json['symbol'] == null ? null : Symbol.fromJson(json['symbol']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (availableAccountTypes != null) {
      resultMap['available_account_types'] = availableAccountTypes!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (availableTradeTypes != null) {
      resultMap['available_trade_types'] = availableTradeTypes!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (market != null) {
      resultMap['market'] = market!.toJson();
    }
    if (submarket != null) {
      resultMap['submarket'] = submarket!.toJson();
    }
    if (symbol != null) {
      resultMap['symbol'] = symbol!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ProductListItem copyWith({
    List<String>? availableAccountTypes,
    List<String>? availableTradeTypes,
    Market? market,
    Submarket? submarket,
    Symbol? symbol,
  }) =>
      ProductListItem(
        availableAccountTypes:
            availableAccountTypes ?? this.availableAccountTypes,
        availableTradeTypes: availableTradeTypes ?? this.availableTradeTypes,
        market: market ?? this.market,
        submarket: submarket ?? this.submarket,
        symbol: symbol ?? this.symbol,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Market model class.
abstract class MarketModel extends Equatable {
  /// Initializes Market model class .
  const MarketModel({
    this.displayName,
    this.name,
  });

  /// Display name of the market.
  final String? displayName;

  /// Internal name of the market..
  final String? name;
}

/// Market class.
class Market extends MarketModel {
  /// Initializes Market class.
  const Market({
    String? displayName,
    String? name,
  }) : super(
          displayName: displayName,
          name: name,
        );

  /// Creates an instance from JSON.
  factory Market.fromJson(Map<String, dynamic> json) => Market(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Market copyWith({
    String? displayName,
    String? name,
  }) =>
      Market(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Submarket model class.
abstract class SubmarketModel extends Equatable {
  /// Initializes Submarket model class .
  const SubmarketModel({
    this.displayName,
    this.name,
  });

  /// Display name of the submarket.
  final String? displayName;

  /// Internal name of the submarket.
  final String? name;
}

/// Submarket class.
class Submarket extends SubmarketModel {
  /// Initializes Submarket class.
  const Submarket({
    String? displayName,
    String? name,
  }) : super(
          displayName: displayName,
          name: name,
        );

  /// Creates an instance from JSON.
  factory Submarket.fromJson(Map<String, dynamic> json) => Submarket(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Submarket copyWith({
    String? displayName,
    String? name,
  }) =>
      Submarket(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Symbol model class.
abstract class SymbolModel extends Equatable {
  /// Initializes Symbol model class .
  const SymbolModel({
    this.displayName,
    this.name,
  });

  /// Display name of the underlying symbol.
  final String? displayName;

  /// Internal name of the underlying symbol.
  final String? name;
}

/// Symbol class.
class Symbol extends SymbolModel {
  /// Initializes Symbol class.
  const Symbol({
    String? displayName,
    String? name,
  }) : super(
          displayName: displayName,
          name: name,
        );

  /// Creates an instance from JSON.
  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Symbol copyWith({
    String? displayName,
    String? name,
  }) =>
      Symbol(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
