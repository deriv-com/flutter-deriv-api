// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';


/// Sell expired response model class.
abstract class SellExpiredResponseModel {
  /// Initializes Sell expired response model class .
  const SellExpiredResponseModel({
    this.sellExpired,
  });

  /// Sell expired contract object containing count of contracts sold
  final SellExpired? sellExpired;
}

/// Sell expired response class.
class SellExpiredResponse extends SellExpiredResponseModel {
  /// Initializes Sell expired response class.
  const SellExpiredResponse({
    SellExpired? sellExpired,
  }) : super(
          sellExpired: sellExpired,
        );

  /// Creates an instance from JSON.
  factory SellExpiredResponse.fromJson(
    dynamic sellExpiredJson,
  ) =>
      SellExpiredResponse(
        sellExpired: sellExpiredJson == null
            ? null
            : SellExpired.fromJson(sellExpiredJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (sellExpired != null) {
      resultMap['sell_expired'] = sellExpired!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SellExpiredResponse copyWith({
    SellExpired? sellExpired,
  }) =>
      SellExpiredResponse(
        sellExpired: sellExpired ?? this.sellExpired,
      );
}
/// Sell expired model class.
abstract class SellExpiredModel {
  /// Initializes Sell expired model class .
  const SellExpiredModel({
    this.count,
  });

  /// The number of contracts that has been sold.
  final int? count;
}

/// Sell expired class.
class SellExpired extends SellExpiredModel {
  /// Initializes Sell expired class.
  const SellExpired({
    int? count,
  }) : super(
          count: count,
        );

  /// Creates an instance from JSON.
  factory SellExpired.fromJson(Map<String, dynamic> json) => SellExpired(
        count: json['count'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['count'] = count;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SellExpired copyWith({
    int? count,
  }) =>
      SellExpired(
        count: count ?? this.count,
      );
}
