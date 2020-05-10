import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App delete model class
class AppDeleteModel extends APIBaseModel {
  /// Initializes
  AppDeleteModel({
    this.succeeded,
  });

  /// Creates an instance from JSON
  factory AppDeleteModel.fromJson(Map<String, dynamic> json) => AppDeleteModel(
        succeeded: getBool(json['app_delete']),
      );

  /// Creates an instance from response
  factory AppDeleteModel.fromResponse({int result}) => AppDeleteModel(
        succeeded: getBool(result),
      );

  /// `true` on success
  final bool succeeded;

  /// Creates a copy of instance with given parameters
  AppDeleteModel copyWith({
    bool succeeded,
  }) =>
      AppDeleteModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
