import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 password change model class
class MT5PasswordChangeModel extends APIBaseModel {
  /// Initializes
  MT5PasswordChangeModel({
    this.succeeded,
  });

  /// Creates an instance from JSON
  factory MT5PasswordChangeModel.fromJson(Map<String, dynamic> json) =>
      MT5PasswordChangeModel(
        succeeded: getBool(json['mt5_password_change']),
      );

  /// `true` on success
  final bool succeeded;

  /// Creates a copy of instance with given parameters
  MT5PasswordChangeModel copyWith({
    bool succeeded,
  }) =>
      MT5PasswordChangeModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
