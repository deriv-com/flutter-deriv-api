// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Passkeys rename response model class.
abstract class PasskeysRenameResponseModel {
  /// Initializes Passkeys rename response model class .
  const PasskeysRenameResponseModel({
    this.passkeysRename,
  });

  /// 1 on success
  final int? passkeysRename;
}

/// Passkeys rename response class.
class PasskeysRenameResponse extends PasskeysRenameResponseModel {
  /// Initializes Passkeys rename response class.
  const PasskeysRenameResponse({
    super.passkeysRename,
  });

  /// Creates an instance from JSON.
  factory PasskeysRenameResponse.fromJson(
    dynamic passkeysRenameJson,
  ) =>
      PasskeysRenameResponse(
        passkeysRename: passkeysRenameJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['passkeys_rename'] = passkeysRename;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PasskeysRenameResponse copyWith({
    int? passkeysRename,
  }) =>
      PasskeysRenameResponse(
        passkeysRename: passkeysRename ?? this.passkeysRename,
      );
}
