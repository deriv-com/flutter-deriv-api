import 'package:flutter_deriv_api/models/base_model.dart';

/// MT5 password reset model class
abstract class MT5PasswordResetModel extends BaseModel {
  /// Class constructor
  MT5PasswordResetModel({
    this.mt5PasswordReset,
  });

  /// `1` on success
  final int mt5PasswordReset;
}
