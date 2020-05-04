import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Logout model class
class LogoutModel extends APIBaseModel {
  /// Initializes
  LogoutModel({
    this.succeeded,
  });

  /// Generate an instance from json
  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        succeeded: json['logout'],
      );

  /// The result of logout request which is `true`
  final bool succeeded;

  /// Generate a copy of instance with given parameters
  LogoutModel copyWith({
    bool succeeded,
  }) =>
      LogoutModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
