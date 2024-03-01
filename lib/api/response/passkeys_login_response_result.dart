// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Passkeys login response model class.
abstract class PasskeysLoginResponseModel {
  /// Initializes Passkeys login response model class .
  const PasskeysLoginResponseModel({
    this.passkeysLogin,
  });

  /// Wrapper of the response.
  final PasskeysLogin? passkeysLogin;
}

/// Passkeys login response class.
class PasskeysLoginResponse extends PasskeysLoginResponseModel {
  /// Initializes Passkeys login response class.
  const PasskeysLoginResponse({
    super.passkeysLogin,
  });

  /// Creates an instance from JSON.
  factory PasskeysLoginResponse.fromJson(
    dynamic passkeysLoginJson,
  ) =>
      PasskeysLoginResponse(
        passkeysLogin: passkeysLoginJson == null
            ? null
            : PasskeysLogin.fromJson(passkeysLoginJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (passkeysLogin != null) {
      resultMap['passkeys_login'] = passkeysLogin!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysLoginResponse copyWith({
    PasskeysLogin? passkeysLogin,
  }) =>
      PasskeysLoginResponse(
        passkeysLogin: passkeysLogin ?? this.passkeysLogin,
      );
}
/// Passkeys login model class.
abstract class PasskeysLoginModel {
  /// Initializes Passkeys login model class .
  const PasskeysLoginModel({
    this.binaryUserId,
    this.verified,
  });

  /// The user id.
  final int? binaryUserId;

  /// The Passkeys login status
  final bool? verified;
}

/// Passkeys login class.
class PasskeysLogin extends PasskeysLoginModel {
  /// Initializes Passkeys login class.
  const PasskeysLogin({
    super.binaryUserId,
    super.verified,
  });

  /// Creates an instance from JSON.
  factory PasskeysLogin.fromJson(Map<String, dynamic> json) => PasskeysLogin(
        binaryUserId: json['binary_user_id'],
        verified: getBool(json['verified']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['binary_user_id'] = binaryUserId;
    resultMap['verified'] = verified;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysLogin copyWith({
    int? binaryUserId,
    bool? verified,
  }) =>
      PasskeysLogin(
        binaryUserId: binaryUserId ?? this.binaryUserId,
        verified: verified ?? this.verified,
      );
}
