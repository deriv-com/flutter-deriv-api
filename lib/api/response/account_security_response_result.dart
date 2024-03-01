// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Account security response model class.
abstract class AccountSecurityResponseModel {
  /// Initializes Account security response model class .
  const AccountSecurityResponseModel({
    this.accountSecurity,
  });

  /// The information of 2-Factor authentication.
  final AccountSecurity? accountSecurity;
}

/// Account security response class.
class AccountSecurityResponse extends AccountSecurityResponseModel {
  /// Initializes Account security response class.
  const AccountSecurityResponse({
    super.accountSecurity,
  });

  /// Creates an instance from JSON.
  factory AccountSecurityResponse.fromJson(
    dynamic accountSecurityJson,
  ) =>
      AccountSecurityResponse(
        accountSecurity: accountSecurityJson == null
            ? null
            : AccountSecurity.fromJson(accountSecurityJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (accountSecurity != null) {
      resultMap['account_security'] = accountSecurity!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountSecurityResponse copyWith({
    AccountSecurity? accountSecurity,
  }) =>
      AccountSecurityResponse(
        accountSecurity: accountSecurity ?? this.accountSecurity,
      );
}
/// Account security model class.
abstract class AccountSecurityModel {
  /// Initializes Account security model class .
  const AccountSecurityModel({
    this.totp,
  });

  /// TOTP information.
  final Totp? totp;
}

/// Account security class.
class AccountSecurity extends AccountSecurityModel {
  /// Initializes Account security class.
  const AccountSecurity({
    super.totp,
  });

  /// Creates an instance from JSON.
  factory AccountSecurity.fromJson(Map<String, dynamic> json) =>
      AccountSecurity(
        totp: json['totp'] == null ? null : Totp.fromJson(json['totp']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (totp != null) {
      resultMap['totp'] = totp!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountSecurity copyWith({
    Totp? totp,
  }) =>
      AccountSecurity(
        totp: totp ?? this.totp,
      );
}
/// Totp model class.
abstract class TotpModel {
  /// Initializes Totp model class .
  const TotpModel({
    this.isEnabled,
    this.secretKey,
  });

  /// Determines whether the 2-Factor authentication is enabled.
  final bool? isEnabled;

  /// The secret key for the 2-Factor authentication.
  final String? secretKey;
}

/// Totp class.
class Totp extends TotpModel {
  /// Initializes Totp class.
  const Totp({
    super.isEnabled,
    super.secretKey,
  });

  /// Creates an instance from JSON.
  factory Totp.fromJson(Map<String, dynamic> json) => Totp(
        isEnabled: getBool(json['is_enabled']),
        secretKey: json['secret_key'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['is_enabled'] = isEnabled;
    resultMap['secret_key'] = secretKey;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Totp copyWith({
    bool? isEnabled,
    String? secretKey,
  }) =>
      Totp(
        isEnabled: isEnabled ?? this.isEnabled,
        secretKey: secretKey ?? this.secretKey,
      );
}
