import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// MT5 password reset model class
class MT5PasswordResetModel extends APIBaseModel {
  /// Initializes
  MT5PasswordResetModel({
    this.succeeded,
  });

  /// `true` on success
  final bool succeeded;
}
