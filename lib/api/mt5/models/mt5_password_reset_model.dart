import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 password reset model class
class MT5PasswordResetModel extends APIBaseModel {
  /// Initializes
  MT5PasswordResetModel({
    this.succeeded,
  });

  /// Creates an instance from json
  factory MT5PasswordResetModel.fromJson(Map<String, dynamic> json) =>
      MT5PasswordResetModel(
        succeeded: getBool(json['mt5_password_reset']),
      );

  /// `true` on success
  final bool succeeded;

  /// Creates a copy of instance with given parameters
  MT5PasswordResetModel copyWith({
    bool succeeded,
  }) =>
      MT5PasswordResetModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
