/// Sell expired receive model class
abstract class SellExpiredReceiveModel {
  /// Initializes
  SellExpiredReceiveModel({
    @required this.sellExpired,
  });

  /// Sell expired contract object containing count of contracts sold
  final SellExpired sellExpired;
}

/// Sell expired receive class
class SellExpiredReceive extends SellExpiredReceiveModel {
  /// Initializes
  SellExpiredReceive({
    @required SellExpired sellExpired,
  }) : super(
          sellExpired: sellExpired,
        );

  /// Creates an instance from JSON
  factory SellExpiredReceive.fromJson(Map<String, dynamic> json) =>
      SellExpiredReceive(
        sellExpired: json['sell_expired'] == null
            ? null
            : SellExpired.fromJson(json['sell_expired']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (sellExpired != null) {
      result['sell_expired'] = sellExpired.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  SellExpiredReceive copyWith({
    SellExpired sellExpired,
  }) =>
      SellExpiredReceive(
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['count'] = count;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SellExpired copyWith({
    int count,
  }) =>
      SellExpired(
        count: count ?? this.count,
      );
}
