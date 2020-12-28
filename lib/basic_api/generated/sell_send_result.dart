/// Sell send model class
abstract class SellSendModel {
  /// Initializes
  SellSendModel({
    @required this.sell,
    @required this.price,
  });

  /// Pass contract_id received from the `portfolio` call.
  final int sell;

  /// Minimum price at which to sell the contract, or `0` for 'sell at market'.
  final double price;
}

/// Sell send class
class SellSend extends SellSendModel {
  /// Initializes
  SellSend({
    @required int sell,
    @required double price,
  }) : super(
          sell: sell,
          price: price,
        );

  /// Creates an instance from JSON
  factory SellSend.fromJson(Map<String, dynamic> json) => SellSend(
        sell: json['sell'],
        price: getDouble(json['price']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['sell'] = sell;
    result['price'] = price;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SellSend copyWith({
    int sell,
    double price,
  }) =>
      SellSend(
        sell: sell ?? this.sell,
        price: price ?? this.price,
      );
}
