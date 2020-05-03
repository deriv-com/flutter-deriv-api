import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// MT5 password check model class
abstract class MT5PasswordCheckModel extends APIBaseModel {
  /// Initializes
  MT5PasswordCheckModel({
    this.mt5PasswordCheck,
  });

  /// `true` on success
  final bool mt5PasswordCheck;
}
