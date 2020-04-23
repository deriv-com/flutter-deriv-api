import 'package:flutter_deriv_api/api/models/mt5_password_change_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 password change class
class MT5PasswordChange extends MT5PasswordChangeModel {
  /// Class constructor
  MT5PasswordChange({
    bool mt5PasswordChange,
  }) : super(
          mt5PasswordChange: mt5PasswordChange,
        );

  /// Creates instance from json
  factory MT5PasswordChange.fromJson(Map<String, dynamic> json) =>
      MT5PasswordChange(
        mt5PasswordChange: getBool(json['mt5_password_change']),
      );

  /// Creates copy of instance with given parameters
  MT5PasswordChange copyWith({
    bool mt5PasswordChange,
  }) =>
      MT5PasswordChange(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
      );
}
