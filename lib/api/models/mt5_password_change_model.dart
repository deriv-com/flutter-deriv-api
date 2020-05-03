import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// MT5 password change model class
abstract class MT5PasswordChangeModel extends APIBaseModel {
  /// Initializes
  MT5PasswordChangeModel({
    this.mt5PasswordChange,
  });

  /// `true` on success
  final bool mt5PasswordChange;
}
