import 'package:flutter_deriv_api/models/mt5/mt5_account.dart';

/// MT5 account class
class MT5Account extends MT5AccountModel {
  /// Class constructor
  MT5Account({
    String accountType,
    double balance,
    String currency,
    String displayBalance,
    String login,
    String mt5AccountType,
  }) : super(
          accountType: accountType,
          balance: balance,
          currency: currency,
          displayBalance: displayBalance,
          login: login,
          mt5AccountType: mt5AccountType,
        );

  /// Creates instance from json
  factory MT5Account.fromJson(Map<String, dynamic> json) => MT5Account(
        accountType: json['account_type'],
        balance: json['balance'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        login: json['login'],
        mt5AccountType: json['mt5_account_type'],
      );

  /// Creates copy of instance with given parameters
  MT5Account copyWith({
    String accountType,
    double balance,
    String currency,
    String displayBalance,
    String login,
    String mt5AccountType,
  }) =>
      MT5Account(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        login: login ?? this.login,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
      );
}
