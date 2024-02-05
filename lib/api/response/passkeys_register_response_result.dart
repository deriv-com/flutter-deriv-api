// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Passkeys register response model class.
abstract class PasskeysRegisterResponseModel {
  /// Initializes Passkeys register response model class .
  const PasskeysRegisterResponseModel({
    this.passkeysRegister,
  });

  /// Wrapper of the response.
  final PasskeysRegister? passkeysRegister;
}

/// Passkeys register response class.
class PasskeysRegisterResponse extends PasskeysRegisterResponseModel {
  /// Initializes Passkeys register response class.
  const PasskeysRegisterResponse({
    super.passkeysRegister,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegisterResponse.fromJson(
    dynamic passkeysRegisterJson,
  ) =>
      PasskeysRegisterResponse(
        passkeysRegister: passkeysRegisterJson == null
            ? null
            : PasskeysRegister.fromJson(passkeysRegisterJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (passkeysRegister != null) {
      resultMap['passkeys_register'] = passkeysRegister!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysRegisterResponse copyWith({
    PasskeysRegister? passkeysRegister,
  }) =>
      PasskeysRegisterResponse(
        passkeysRegister: passkeysRegister ?? this.passkeysRegister,
      );
}
/// Passkeys register model class.
abstract class PasskeysRegisterModel {
  /// Initializes Passkeys register model class .
  const PasskeysRegisterModel({
    this.createdAt,
    this.id,
    this.lastUsed,
    this.name,
    this.passkeyId,
    this.storedOn,
  });

  /// The epoch timestamp when the passkey was created.
  final DateTime? createdAt;

  /// The system id of the stored passkey.
  final int? id;

  /// The epoch timestamp that the key was last used to authenticate the user.
  final DateTime? lastUsed;

  /// The descriptive name of the passkey.
  final String? name;

  /// The id of the passkey credential.
  final String? passkeyId;

  /// The name of the device where the credential is stored on.
  final String? storedOn;
}

/// Passkeys register class.
class PasskeysRegister extends PasskeysRegisterModel {
  /// Initializes Passkeys register class.
  const PasskeysRegister({
    super.createdAt,
    super.id,
    super.lastUsed,
    super.name,
    super.passkeyId,
    super.storedOn,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegister.fromJson(Map<String, dynamic> json) =>
      PasskeysRegister(
        createdAt: getDateTime(json['created_at']),
        id: json['id'],
        lastUsed: getDateTime(json['last_used']),
        name: json['name'],
        passkeyId: json['passkey_id'],
        storedOn: json['stored_on'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['created_at'] = getSecondsSinceEpochDateTime(createdAt);
    resultMap['id'] = id;
    resultMap['last_used'] = getSecondsSinceEpochDateTime(lastUsed);
    resultMap['name'] = name;
    resultMap['passkey_id'] = passkeyId;
    resultMap['stored_on'] = storedOn;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysRegister copyWith({
    DateTime? createdAt,
    int? id,
    DateTime? lastUsed,
    String? name,
    String? passkeyId,
    String? storedOn,
  }) =>
      PasskeysRegister(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        passkeyId: passkeyId ?? this.passkeyId,
        storedOn: storedOn ?? this.storedOn,
      );
}
