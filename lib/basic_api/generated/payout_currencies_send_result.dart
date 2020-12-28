/// Payout currencies send model class
abstract class PayoutCurrenciesSendModel {
  /// Initializes
  PayoutCurrenciesSendModel({
    @required this.payoutCurrencies,
  });

  /// Must be `1`
  final int payoutCurrencies;
}

/// Payout currencies send class
class PayoutCurrenciesSend extends PayoutCurrenciesSendModel {
  /// Initializes
  PayoutCurrenciesSend({
    @required int payoutCurrencies,
  }) : super(
          payoutCurrencies: payoutCurrencies,
        );

  /// Creates an instance from JSON
  factory PayoutCurrenciesSend.fromJson(Map<String, dynamic> json) =>
      PayoutCurrenciesSend(
        payoutCurrencies: json['payout_currencies'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['payout_currencies'] = payoutCurrencies;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PayoutCurrenciesSend copyWith({
    int payoutCurrencies,
  }) =>
      PayoutCurrenciesSend(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
      );
}
