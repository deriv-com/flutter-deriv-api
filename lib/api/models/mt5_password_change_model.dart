import 'package:flutter_deriv_api/api/models/base_model.dart';

/// MT5 password change model class
abstract class MT5PasswordChangeModel extends BaseModel {
  /// Class constructor
  MT5PasswordChangeModel({
    this.mt5PasswordChange,
  });

  /// `1` on success
  final int mt5PasswordChange;
}
