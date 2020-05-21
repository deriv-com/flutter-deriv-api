import 'package:flutter_deriv_api/api/account/models/account_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Account class
class Account extends AccountModel {
  /// Initializes
  Account({
    String currency,
    DateTime excludedUntil,
    bool isDisabled,
    bool isVirtual,
    String landingCompanyName,
    String loginId,
  }) : super(
          currency: currency,
          excludedUntil: excludedUntil,
          isDisabled: isDisabled,
          isVirtual: isVirtual,
          landingCompanyName: landingCompanyName,
          loginId: loginId,
        );

  /// Generate an instance from JSON
  factory Account.fromJson(Map<String, dynamic> json) => Account(
        currency: json['currency'],
        excludedUntil: getDateTime(json['excluded_until']),
        isDisabled: getBool(json['is_disabled']),
        isVirtual: getBool(json['is_virtual']),
        landingCompanyName: json['landing_company_name'],
        loginId: json['loginid'],
      );

  /// Generate a copy of instance with given parameters
  Account copyWith({
    String currency,
    int excludedUntil,
    bool isDisabled,
    bool isVirtual,
    String landingCompanyName,
    String loginId,
  }) =>
      Account(
        currency: currency ?? this.currency,
        excludedUntil: excludedUntil ?? this.excludedUntil,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        loginId: loginId ?? this.loginId,
      );
}
