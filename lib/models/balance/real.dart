/// Real account info
class Real {
  /// Constructor
  Real({this.amount, this.currency});

  /// Instance from JSON
  factory Real.fromJson(Map<String, dynamic> json) => Real(
        amount: json['amount'],
        currency: json['currency'],
      );

  /// Total amount of all balances of all real accounts
  final double amount;

  /// Currency code.
  final String currency;

  /// ToJson
  Real copyWith({
    double amount,
    String currency,
  }) =>
      Real(amount: amount ?? this.amount, currency: currency ?? this.currency);
}
