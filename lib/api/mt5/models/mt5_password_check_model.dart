import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 password check model class
class MT5PasswordCheckModel extends APIBaseModel {
  /// Initializes
  MT5PasswordCheckModel({
    this.succeeded,
  });

  /// Generates an instance from json
  factory MT5PasswordCheckModel.fromJson(Map<String, dynamic> json) =>
      MT5PasswordCheckModel(
        succeeded: getBool(json['mt5_password_check']),
      );

  /// `true` on success
  final bool succeeded;

  /// Creates copy of instance with given parameters
  MT5PasswordCheckModel copyWith({
    bool succeeded,
  }) =>
      MT5PasswordCheckModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
