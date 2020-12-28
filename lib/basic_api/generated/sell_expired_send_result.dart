/// Sell expired send model class
abstract class SellExpiredSendModel {
  /// Initializes
  SellExpiredSendModel({
    @required this.sellExpired,
  });

  /// Must be `1`
  final int sellExpired;
}

/// Sell expired send class
class SellExpiredSend extends SellExpiredSendModel {
  /// Initializes
  SellExpiredSend({
    @required int sellExpired,
  }) : super(
          sellExpired: sellExpired,
        );

  /// Creates an instance from JSON
  factory SellExpiredSend.fromJson(Map<String, dynamic> json) =>
      SellExpiredSend(
        sellExpired: json['sell_expired'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['sell_expired'] = sellExpired;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SellExpiredSend copyWith({
    int sellExpired,
  }) =>
      SellExpiredSend(
        sellExpired: sellExpired ?? this.sellExpired,
      );
}
