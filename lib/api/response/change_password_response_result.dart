// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Change password response model class.
abstract class ChangePasswordResponseModel extends Equatable {
  /// Initializes Change password response model class .
  const ChangePasswordResponseModel({
    this.changePassword,
  });

  /// If set to `true`, password updated.
  final bool? changePassword;
}

/// Change password response class.
class ChangePasswordResponse extends ChangePasswordResponseModel {
  /// Initializes Change password response class.
  const ChangePasswordResponse({
    bool? changePassword,
  }) : super(
          changePassword: changePassword,
        );

  /// Creates an instance from JSON.
  factory ChangePasswordResponse.fromJson(
    dynamic changePasswordJson,
  ) =>
      ChangePasswordResponse(
        changePassword: getBool(changePasswordJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['change_password'] = changePassword;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ChangePasswordResponse copyWith({
    bool? changePassword,
  }) =>
      ChangePasswordResponse(
        changePassword: changePassword ?? this.changePassword,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
