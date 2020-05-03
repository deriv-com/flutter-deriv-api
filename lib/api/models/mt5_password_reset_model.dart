import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// MT5 password reset model class
abstract class MT5PasswordResetModel extends APIBaseModel {
  /// Initializes
  MT5PasswordResetModel({
    this.mt5PasswordReset,
  });

  /// `true` on success
  final bool mt5PasswordReset;
}
