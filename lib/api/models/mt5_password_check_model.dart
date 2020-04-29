import 'package:flutter_deriv_api/api/models/base_model.dart';

/// MT5 password check model class
abstract class MT5PasswordCheckModel extends BaseModel {
  /// Class constructor
  MT5PasswordCheckModel({
    this.mt5PasswordCheck,
  });

  /// `true` on success
  final bool mt5PasswordCheck;
}
