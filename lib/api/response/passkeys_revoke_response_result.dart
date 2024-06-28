// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_revoke_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_revoke_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Passkeys revoke response model class.
abstract class PasskeysRevokeResponseModel {
  /// Initializes Passkeys revoke response model class .
  const PasskeysRevokeResponseModel({
    this.passkeysRevoke,
  });

  /// 1 on success
  final int? passkeysRevoke;
}

/// Passkeys revoke response class.
class PasskeysRevokeResponse extends PasskeysRevokeResponseModel {
  /// Initializes Passkeys revoke response class.
  const PasskeysRevokeResponse({
    super.passkeysRevoke,
  });

  /// Creates an instance from JSON.
  factory PasskeysRevokeResponse.fromJson(
    dynamic passkeysRevokeJson,
  ) =>
      PasskeysRevokeResponse(
        passkeysRevoke: passkeysRevokeJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['passkeys_revoke'] = passkeysRevoke;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysRevokeResponse copyWith({
    int? passkeysRevoke,
  }) =>
      PasskeysRevokeResponse(
        passkeysRevoke: passkeysRevoke ?? this.passkeysRevoke,
      );
}
