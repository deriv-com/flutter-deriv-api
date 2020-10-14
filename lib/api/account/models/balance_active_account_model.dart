import 'package:flutter_deriv_api/api/account/models/balance_total_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

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
        demoAccount: getBool(json['demo_account']),
        type: getEnumFromString(
          values: UserAccountType.values,
          name: json['type'],
        ),
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
  final bool demoAccount;

  /// Type of account.
  final UserAccountType type;

  /// Generate a copy of instance with given parameters.
  BalanceActiveAccountModel copyWith(
    String loginId,
    double balance,
    double convertedAmount,
    String currency,
    int demoAccount,
    UserAccountType type,
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
