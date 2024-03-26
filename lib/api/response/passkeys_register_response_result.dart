// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

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
    this.createdOn,
    this.id,
    this.lastUsed,
    this.name,
    this.passkey,
    this.userId,
  });

  /// The date of the passkey creation
  final String? createdOn;

  /// The system id of the passkey
  final String? id;

  /// The date of the last passkey usage
  final String? lastUsed;

  /// The name of the passkey
  final String? name;

  /// The id of the credential. for mock only
  final Map<String, dynamic>? passkey;

  /// The id of the user. for mock only
  final String? userId;
}

/// Passkeys register class.
class PasskeysRegister extends PasskeysRegisterModel {
  /// Initializes Passkeys register class.
  const PasskeysRegister({
    super.createdOn,
    super.id,
    super.lastUsed,
    super.name,
    super.passkey,
    super.userId,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegister.fromJson(Map<String, dynamic> json) =>
      PasskeysRegister(
        createdOn: json['created_on'],
        id: json['id'],
        lastUsed: json['last_used'],
        name: json['name'],
        passkey: json['passkey'],
        userId: json['user_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['created_on'] = createdOn;
    resultMap['id'] = id;
    resultMap['last_used'] = lastUsed;
    resultMap['name'] = name;
    resultMap['passkey'] = passkey;
    resultMap['user_id'] = userId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysRegister copyWith({
    String? createdOn,
    String? id,
    String? lastUsed,
    String? name,
    Map<String, dynamic>? passkey,
    String? userId,
  }) =>
      PasskeysRegister(
        createdOn: createdOn ?? this.createdOn,
        id: id ?? this.id,
        lastUsed: lastUsed ?? this.lastUsed,
        name: name ?? this.name,
        passkey: passkey ?? this.passkey,
        userId: userId ?? this.userId,
      );
}
