import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/mt5_account_model.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';

/// MT5 account class
class MT5Account extends MT5AccountModel {
  /// Class constructor
  MT5Account({
    AccountType accountType,
    double balance,
    String currency,
    String displayBalance,
    String login,
    MT5AccountType mt5AccountType,
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
        accountType: EnumHelper.getEnum(
          enumItems: AccountType.values,
          value: json['account_type'],
        ),
        balance: json['balance'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        login: json['login'],
        mt5AccountType: EnumHelper.getEnum(
          enumItems: MT5AccountType.values,
          value: json['mt5_account_type'],
        ),
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
