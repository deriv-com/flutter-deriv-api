import 'package:flutter_deriv_api/models/base_model.dart';

/// MT5 settings model class
abstract class MT5SettingsModel extends BaseModel {
  /// Class constructor
  MT5SettingsModel({
    this.address,
    this.balance,
    this.city,
    this.company,
    this.country,
    this.currency,
    this.email,
    this.group,
    this.leverage,
    this.login,
    this.name,
    this.phone,
    this.phonePassword,
    this.state,
    this.zipCode,
  });

  /// The address of the user. The maximum length of the address is 128 characters.
  final String address;

  /// Account balance.
  final String balance;

  /// User's city of residence.
  final String city;

  /// Name of the client's company. The maximum length of the company name is 64 characters.
  final String company;

  /// 2-letter country code.
  final String country;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String currency;

  /// Email address.
  final String email;

  /// The group where account belongs to.
  final String group;

  /// Client leverage (from 1 to 1000).
  final double leverage;

  /// Login ID of the user's MT5 account.
  final String login;

  /// Client's name. The maximum length of a client's symbol name is 128 characters.
  final String name;

  /// User's phone number.
  final String phone;

  /// The user's phone password.
  final String phonePassword;

  /// User's state (region) of residence.
  final String state;

  /// User's zip code.
  final String zipCode;
}
