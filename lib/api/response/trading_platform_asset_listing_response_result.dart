// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform asset listing response model class.
abstract class TradingPlatformAssetListingResponseModel {
  /// Initializes Trading platform asset listing response model class .
  const TradingPlatformAssetListingResponseModel({
    this.tradingPlatformAssetListing,
    this.subscription,
  });

  /// Containing Trading asset objects.
  final Map<String, TradingPlatformAssetListingProperty>?
      tradingPlatformAssetListing;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Trading platform asset listing response class.
class TradingPlatformAssetListingResponse
    extends TradingPlatformAssetListingResponseModel {
  /// Initializes Trading platform asset listing response class.
  const TradingPlatformAssetListingResponse({
    super.tradingPlatformAssetListing,
    super.subscription,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAssetListingResponse.fromJson(
    dynamic tradingPlatformAssetListingJson,
    dynamic subscriptionJson,
  ) =>
      TradingPlatformAssetListingResponse(
        tradingPlatformAssetListing: tradingPlatformAssetListingJson == null
            ? null
            : Map<String, TradingPlatformAssetListingProperty>.fromEntries(
                tradingPlatformAssetListingJson.entries.map<
                        MapEntry<String, TradingPlatformAssetListingProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, TradingPlatformAssetListingProperty>(
                            entry.key,
                            TradingPlatformAssetListingProperty.fromJson(
                                entry.value)))),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading_platform_asset_listing'] = tradingPlatformAssetListing;
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformAssetListingResponse copyWith({
    Map<String, TradingPlatformAssetListingProperty>?
        tradingPlatformAssetListing,
    Subscription? subscription,
  }) =>
      TradingPlatformAssetListingResponse(
        tradingPlatformAssetListing:
            tradingPlatformAssetListing ?? this.tradingPlatformAssetListing,
        subscription: subscription ?? this.subscription,
      );
}
/// Trading platform asset listing property model class.
abstract class TradingPlatformAssetListingPropertyModel {
  /// Initializes Trading platform asset listing property model class .
  const TradingPlatformAssetListingPropertyModel({
    this.assets,
  });

  /// MT5 assets.
  final List<AssetsItem>? assets;
}

/// Trading platform asset listing property class.
class TradingPlatformAssetListingProperty
    extends TradingPlatformAssetListingPropertyModel {
  /// Initializes Trading platform asset listing property class.
  const TradingPlatformAssetListingProperty({
    super.assets,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAssetListingProperty.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformAssetListingProperty(
        assets: json['assets'] == null
            ? null
            : List<AssetsItem>.from(
                json['assets']?.map(
                  (dynamic item) => AssetsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (assets != null) {
      resultMap['assets'] = assets!
          .map<dynamic>(
            (AssetsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformAssetListingProperty copyWith({
    List<AssetsItem>? assets,
  }) =>
      TradingPlatformAssetListingProperty(
        assets: assets ?? this.assets,
      );
}
/// Assets item model class.
abstract class AssetsItemModel {
  /// Initializes Assets item model class .
  const AssetsItemModel({
    this.ask,
    this.bid,
    this.dayPercentageChange,
    this.displayOrder,
    this.market,
    this.shortcode,
    this.spread,
    this.symbol,
  });

  /// Ask price of asset.
  final double? ask;

  /// Bid price of asset.
  final double? bid;

  /// 1 day percentage change of price.
  final String? dayPercentageChange;

  /// Display order of asset.
  final double? displayOrder;

  /// Market type of asset.
  final String? market;

  /// The asset shortcode.
  final String? shortcode;

  /// Spread of asset.
  final double? spread;

  /// Asset symbol.
  final String? symbol;
}

/// Assets item class.
class AssetsItem extends AssetsItemModel {
  /// Initializes Assets item class.
  const AssetsItem({
    super.ask,
    super.bid,
    super.dayPercentageChange,
    super.displayOrder,
    super.market,
    super.shortcode,
    super.spread,
    super.symbol,
  });

  /// Creates an instance from JSON.
  factory AssetsItem.fromJson(Map<String, dynamic> json) => AssetsItem(
        ask: getDouble(json['ask']),
        bid: getDouble(json['bid']),
        dayPercentageChange: json['day_percentage_change'],
        displayOrder: getDouble(json['display_order']),
        market: json['market'],
        shortcode: json['shortcode'],
        spread: getDouble(json['spread']),
        symbol: json['symbol'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask'] = ask;
    resultMap['bid'] = bid;
    resultMap['day_percentage_change'] = dayPercentageChange;
    resultMap['display_order'] = displayOrder;
    resultMap['market'] = market;
    resultMap['shortcode'] = shortcode;
    resultMap['spread'] = spread;
    resultMap['symbol'] = symbol;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AssetsItem copyWith({
    double? ask,
    double? bid,
    String? dayPercentageChange,
    double? displayOrder,
    String? market,
    String? shortcode,
    double? spread,
    String? symbol,
  }) =>
      AssetsItem(
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        dayPercentageChange: dayPercentageChange ?? this.dayPercentageChange,
        displayOrder: displayOrder ?? this.displayOrder,
        market: market ?? this.market,
        shortcode: shortcode ?? this.shortcode,
        spread: spread ?? this.spread,
        symbol: symbol ?? this.symbol,
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
