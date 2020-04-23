import 'package:flutter_deriv_api/api/models/mt5_password_reset_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 password reset class
class MT5PasswordReset extends MT5PasswordResetModel {
  /// Class constructor
  MT5PasswordReset({
    bool mt5PasswordReset,
  }) : super(
          mt5PasswordReset: mt5PasswordReset,
        );

  /// Creates instance from json
  factory MT5PasswordReset.fromJson(Map<String, dynamic> json) =>
      MT5PasswordReset(
        mt5PasswordReset: getBool(json['mt5_password_reset']),
      );

  /// Creates copy of instance with given parameters
  MT5PasswordReset copyWith({
    bool mt5PasswordReset,
  }) =>
      MT5PasswordReset(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
      );
}
