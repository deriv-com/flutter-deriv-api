import 'package:flutter_deriv_api/models/mt5/mt5_password_check.dart';

/// MT5 password check class
class MT5PasswordCheck extends MT5PasswordCheckModel {
  /// Class constructor
  MT5PasswordCheck({
    int mt5PasswordCheck,
  }) : super(
          mt5PasswordCheck: mt5PasswordCheck,
        );

  /// Creates instance from json
  factory MT5PasswordCheck.fromJson(Map<String, dynamic> json) =>
      MT5PasswordCheck(
        mt5PasswordCheck: json['mt5_password_check'],
      );

  /// Creates copy of instance with given parameters
  MT5PasswordCheck copyWith({
    int mt5PasswordCheck,
  }) =>
      MT5PasswordCheck(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
      );
}
