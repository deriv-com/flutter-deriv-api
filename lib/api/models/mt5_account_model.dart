import 'package:flutter_deriv_api/api/models/base_model.dart';

/// MT5 account model class
abstract class MT5AccountModel extends BaseModel {
  /// Class constructor
  MT5AccountModel({
    this.accountType,
    this.balance,
    this.currency,
    this.displayBalance,
    this.login,
    this.mt5AccountType,
  });

  /// Account type.
  final String accountType;

  /// Account balance.
  final double balance;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String currency;

  /// Account balance, formatted to appropriate decimal places.
  final String displayBalance;

  /// Login ID of the user's new MT5 account. Login could have 2 types of prefixes: MTD, MTR. MTD - for demo accounts and MTR for real money accounts.
  final String login;

  /// Sub account type, present only when account type is either `demo` or `financial`.
  final String mt5AccountType;
}
