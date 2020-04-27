import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/mt5_account_model.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';

/// MT5 account class
class MT5Account extends MT5AccountModel {
  /// Class constructor
  MT5Account({
    AccountType accountType,
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    int leverage,
    String login,
    MT5AccountType mt5AccountType,
    String name,
  }) : super(
          accountType: accountType,
          balance: balance,
          country: country,
          currency: currency,
          displayBalance: displayBalance,
          email: email,
          group: group,
          leverage: leverage,
          login: login,
          mt5AccountType: mt5AccountType,
          name: name,
        );

  /// Creates instance from json
  factory MT5Account.fromJson(Map<String, dynamic> json) => MT5Account(
        accountType: EnumHelper.getEnum(
          values: AccountType.values,
          name: json['account_type'],
        ),
        balance: json['balance'],
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        leverage: json['leverage'],
        login: json['login'],
        mt5AccountType: EnumHelper.getEnum(
          values: MT5AccountType.values,
          name: json['mt5_account_type'],
        ),
        name: json['name'],
      );

  /// Creates copy of instance with given parameters
  MT5Account copyWith({
    AccountType accountType,
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    int leverage,
    String login,
    MT5AccountType mt5AccountType,
    String name,
  }) =>
      MT5Account(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        email: email ?? this.email,
        group: group ?? this.group,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
        name: name ?? this.name,
      );
}
