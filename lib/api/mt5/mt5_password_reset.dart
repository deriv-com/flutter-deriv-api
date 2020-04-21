import 'package:flutter_deriv_api/api/models/mt5_password_reset_model.dart';

/// MT5 password reset class
class MT5PasswordReset extends MT5PasswordResetModel {
  /// Class constructor
  MT5PasswordReset({
    int mt5PasswordReset,
  }) : super(
          mt5PasswordReset: mt5PasswordReset,
        );

  /// Creates instance from json
  factory MT5PasswordReset.fromJson(Map<String, dynamic> json) =>
      MT5PasswordReset(
        mt5PasswordReset: json['mt5_password_reset'],
      );

  /// Creates copy of instance with given parameters
  MT5PasswordReset copyWith({
    int mt5PasswordReset,
  }) =>
      MT5PasswordReset(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
      );
}
