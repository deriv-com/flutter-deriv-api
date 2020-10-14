/// Balance active account model class
class BalanceActiveAccountModel {
  /// Initializes
  BalanceActiveAccountModel({
    this.loginId,
    this.balance,
    this.convertedAmount,
    this.currency,
    this.demoAccount,
    this.type,
  });

  /// Generate an instance from JSON
  factory BalanceActiveAccountModel.fromJson({
    String loginId,
    Map<String, dynamic> json,
  }) =>
      BalanceActiveAccountModel(
        loginId: loginId,
        balance: json['balance']?.toDouble(),
        convertedAmount: json['converted_amount']?.toDouble(),
        currency: json['currency'],
        demoAccount: json['demo_account']?.toInt(),
        type: json['type'],
      );

  /// Client login id.
  final String loginId;

  /// The balance amount of current account.
  final double balance;

  /// Account balance converted the total currency.
  final double convertedAmount;

  /// Account currency.
  final String currency;

  /// If set to 1, this is a demo account.
  final int demoAccount;

  /// Type of account.
  final String type;

  /// Generate a copy of instance with given parameters.
  BalanceActiveAccountModel copyWith(
    String loginId,
    double balance,
    double convertedAmount,
    String currency,
    int demoAccount,
    String type,
  ) =>
      BalanceActiveAccountModel(
        loginId: loginId ?? this.loginId,
        balance: balance ?? this.balance,
        convertedAmount: convertedAmount ?? this.convertedAmount,
        currency: currency ?? this.currency,
        demoAccount: demoAccount ?? this.demoAccount,
        type: type ?? this.type,
      );
}
