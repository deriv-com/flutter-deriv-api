import 'package:flutter_deriv_api/api/models/base_model.dart';

/// MT5 login model class
abstract class MT5LoginModel extends BaseModel {
  /// Initializes
  MT5LoginModel({
    this.balance,
    this.country,
    this.currency,
    this.displayBalance,
    this.email,
    this.group,
    this.leverage,
    this.login,
    this.name,
  });

  /// Balance of the MT5 account.
  final double balance;

  /// Residence of the MT5 account.
  final String country;

  /// Currency of the MT5 account.
  final String currency;

  /// Account balance, formatted to appropriate decimal places.
  final String displayBalance;

  /// Email address of the MT5 account.
  final String email;

  /// Group type of the MT5 account, e.g. `demo\svg_standard`
  final String group;

  /// Leverage of the MT5 account (1 to 1000).
  final double leverage;

  /// Login of MT5 account.
  final String login;

  /// Name of the owner of the MT5 account.
  final String name;
}
