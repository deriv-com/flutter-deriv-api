import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// MT5 account model class
abstract class MT5AccountModel extends BaseModel {
  /// Initializes
  MT5AccountModel({
    this.accountType,
    this.balance,
    this.country,
    this.currency,
    this.displayBalance,
    this.email,
    this.group,
    this.leverage,
    this.login,
    this.mt5AccountType,
    this.name,
  });

  /// Account type.
  final AccountType accountType;

  /// Account balance.
  final double balance;

  /// Residence of the MT5 account.
  final String country;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String currency;

  /// Account balance, formatted to appropriate decimal places.
  final String displayBalance;

  /// Email address of the MT5 account.
  final String email;

  /// Group type of the MT5 account, e.g. `demo\svg_standard`
  final String group;

  /// Leverage of the MT5 account (1 to 1000).
  final int leverage;

  /// Login ID of the user's new MT5 account. Login could have 2 types of prefixes: MTD, MTR. MTD - for demo accounts and MTR for real money accounts.
  final String login;

  /// Sub account type, present only when account type is either `demo` or `financial`.
  final MT5AccountType mt5AccountType;

  /// Name of the owner of the MT5 account.
  final String name;
}
