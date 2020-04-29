import 'package:flutter_deriv_api/api/models/mt5_login_model.dart';

/// MT5 login class
class MT5Login extends MT5LoginModel {
  /// Class constructor
  MT5Login({
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    double leverage,
    String login,
    String name,
  }) : super(
          balance: balance,
          country: country,
          currency: currency,
          displayBalance: displayBalance,
          email: email,
          group: group,
          leverage: leverage,
          login: login,
          name: name,
        );

  /// Creates instance from json
  factory MT5Login.fromJson(Map<String, dynamic> json) => MT5Login(
        balance: json['balance'],
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        leverage: json['leverage'],
        login: json['login'],
        name: json['name'],
      );

  /// Creates copy of instance with given parameters
  MT5Login copyWith({
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    double leverage,
    String login,
    String name,
  }) =>
      MT5Login(
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        email: email ?? this.email,
        group: group ?? this.group,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        name: name ?? this.name,
      );
}
