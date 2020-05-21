import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// MT5 password check model class
abstract class MT5PasswordCheckModel extends APIBaseModel {
  /// Initializes
  MT5PasswordCheckModel({
    this.succeeded,
  });

  /// `true` on success
  final bool succeeded;
}
