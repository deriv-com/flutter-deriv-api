import 'package:flutter_deriv_api/api/models/mt5_password_check_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 password check class
class MT5PasswordCheck extends MT5PasswordCheckModel {
  /// Initializes
  MT5PasswordCheck({
    bool mt5PasswordCheck,
  }) : super(
          mt5PasswordCheck: mt5PasswordCheck,
        );

  /// Creates instance from json
  factory MT5PasswordCheck.fromJson(Map<String, dynamic> json) =>
      MT5PasswordCheck(
        mt5PasswordCheck: getBool(json['mt5_password_check']),
      );

  /// Creates copy of instance with given parameters
  MT5PasswordCheck copyWith({
    bool mt5PasswordCheck,
  }) =>
      MT5PasswordCheck(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
      );
}
