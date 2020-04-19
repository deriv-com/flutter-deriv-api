/// MT5 accounts info
class Mt5 {
  /// Constructor
  Mt5({this.amount, this.currency});

  /// Instance from JSON
  factory Mt5.fromJson(Map<String, dynamic> json) => Mt5(
        amount: json['amount'],
        currency: json['currency'],
      );

  /// Total balance of all MT5 accounts
  final double amount;

  /// Currency code.
  final String currency;

  /// ToJson
  Mt5 copyWith({
    double amount,
    String currency,
  }) =>
      Mt5(amount: amount ?? this.amount, currency: currency ?? this.currency);
}
