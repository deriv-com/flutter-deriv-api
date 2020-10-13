/// {@template balanceActiveAccountModel}
/// Active accounts info from Balance.
/// {@endtemplate}
class BalanceActiveAccountModel {
  /// {@macro balanceActiveAccountModel}
  BalanceActiveAccountModel(
      {this.balance,
      this.convertedAmount,
      this.currency,
      this.demoAccount,
      this.type});


  /// Generate an instance from JSON
  BalanceActiveAccountModel.fromJson(Map<String, dynamic> json) {
    balance = json['balance']?.toDouble();
    convertedAmount = json['converted_amount']?.toDouble();
    currency = json['currency'];
    demoAccount = json['demo_account']?.toInt();
    type = json['type'];
  }
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
  
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['converted_amount'] = convertedAmount;
    data['currency'] = currency;
    data['demo_account'] = demoAccount;
    data['type'] = type;
    return data;
  }
}
