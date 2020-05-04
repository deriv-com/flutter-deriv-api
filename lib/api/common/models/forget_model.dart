import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Forget model class
class ForgetModel extends APIBaseModel {
  /// Initializes
  ForgetModel({
    this.succeeded,
  });

  /// Creates instance from json
  factory ForgetModel.fromJson(Map<String, dynamic> json) => ForgetModel(
        succeeded: getBool(json['forget']),
      );

  /// If set to true, stream exited and stopped. If set to false, stream did not exist.
  final bool succeeded;

  /// Creates copy of instance with given parameters
  ForgetModel copyWith({
    bool succeeded,
  }) =>
      ForgetModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
