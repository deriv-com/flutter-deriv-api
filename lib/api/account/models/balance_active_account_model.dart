/// Individual accounts details.
class BalanceActiveAccountModel {
  /// Initializes the model
  BalanceActiveAccountModel({
    this.loginId,
    this.balance,
    this.convertedAmount,
    this.currency,
    this.demoAccount,
    this.type,
  });

  /// Generate an instance from JSON
  BalanceActiveAccountModel.fromJson({String key, Map<String, dynamic> json}) {
    loginId = key;
    balance = json['balance']?.toDouble();
    convertedAmount = json['converted_amount']?.toDouble();
    currency = json['currency'];
    demoAccount = json['demo_account']?.toInt();
    type = json['type'];
  }

  /// Client loginid.
  String loginId;

  /// The balance amount of current account.
  double balance;

  /// Account balance converted the total currency.
  double convertedAmount;

  /// Account currency.
  String currency;

  /// If set to 1, this is a demo account.
  int demoAccount;

  /// Type of account.
  String type;

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
