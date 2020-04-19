import 'package:flutter_deriv_api/models/authorize/account.dart';

/// Account class
class Account extends AccountModel {
  /// Class constructor
  Account({
    String currency,
    int excludedUntil,
    bool isDisabled,
    bool isVirtual,
    String landingCompanyName,
    String loginid,
  }) : super(
          currency: currency,
          excludedUntil: excludedUntil,
          isDisabled: isDisabled,
          isVirtual: isVirtual,
          landingCompanyName: landingCompanyName,
          loginid: loginid,
        );

  /// Generate instance from json
  factory Account.fromJson(Map<String, dynamic> json) => Account(
        currency: json['currency'],
        excludedUntil: json['excluded_until'],
        isDisabled: json['is_disabled'],
        isVirtual: json['is_virtual'],
        landingCompanyName: json['landing_company_name'],
        loginid: json['loginid'],
      );

  /// Generate copy of instance with given parameters
  Account copyWith({
    String currency,
    int excludedUntil,
    int isDisabled,
    int isVirtual,
    String landingCompanyName,
    String loginid,
  }) =>
      Account(
        currency: currency ?? this.currency,
        excludedUntil: excludedUntil ?? this.excludedUntil,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        loginid: loginid ?? this.loginid,
      );
}
