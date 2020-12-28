/// Payout currencies receive model class
abstract class PayoutCurrenciesReceiveModel {
  /// Initializes
  PayoutCurrenciesReceiveModel({
    @required this.payoutCurrencies,
  });

  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String> payoutCurrencies;
}

/// Payout currencies receive class
class PayoutCurrenciesReceive extends PayoutCurrenciesReceiveModel {
  /// Initializes
  PayoutCurrenciesReceive({
    @required List<String> payoutCurrencies,
  }) : super(
          payoutCurrencies: payoutCurrencies,
        );

  /// Creates an instance from JSON
  factory PayoutCurrenciesReceive.fromJson(Map<String, dynamic> json) =>
      PayoutCurrenciesReceive(
        payoutCurrencies:
            List<String>.from(json['payout_currencies'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['payout_currencies'] = payoutCurrencies;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PayoutCurrenciesReceive copyWith({
    List<String> payoutCurrencies,
  }) =>
      PayoutCurrenciesReceive(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
      );
}
