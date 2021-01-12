import 'package:meta/meta.dart';

/// Sell expired response model class
abstract class SellExpiredResponseModel {
  /// Initializes
  SellExpiredResponseModel({
    @required this.sellExpired,
  });

  /// Sell expired contract object containing count of contracts sold
  final SellExpired sellExpired;
}

/// Sell expired response class
class SellExpiredResponse extends SellExpiredResponseModel {
  /// Initializes
  SellExpiredResponse({
    @required SellExpired sellExpired,
  }) : super(
          sellExpired: sellExpired,
        );

  /// Creates an instance from JSON
  factory SellExpiredResponse.fromJson(
    dynamic sellExpiredJson,
  ) =>
      SellExpiredResponse(
        sellExpired: sellExpiredJson == null
            ? null
            : SellExpired.fromJson(sellExpiredJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (sellExpired != null) {
      resultMap['sell_expired'] = sellExpired.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  SellExpiredResponse copyWith({
    SellExpired sellExpired,
  }) =>
      SellExpiredResponse(
        sellExpired: sellExpired ?? this.sellExpired,
      );
}
/// Sell expired model class
abstract class SellExpiredModel {
  /// Initializes
  SellExpiredModel({
    @required this.count,
  });

  /// The number of contracts that has been sold.
  final int count;
}

/// Sell expired class
class SellExpired extends SellExpiredModel {
  /// Initializes
  SellExpired({
    @required int count,
  }) : super(
          count: count,
        );

  /// Creates an instance from JSON
  factory SellExpired.fromJson(Map<String, dynamic> json) => SellExpired(
        count: json['count'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['count'] = count;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  SellExpired copyWith({
    int count,
  }) =>
      SellExpired(
        count: count ?? this.count,
      );
}
