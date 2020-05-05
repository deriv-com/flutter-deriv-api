import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App delete model class
class AppDeleteModel extends APIBaseModel {
  /// Initializes
  AppDeleteModel({
    this.succeeded,
  });

  /// Generates an instance from json
  factory AppDeleteModel.fromJson(Map<String, dynamic> json) => AppDeleteModel(
        succeeded: getBool(json['app_delete']),
      );

  /// `true` on success
  final bool succeeded;

  /// Creates copy of instance with given parameters
  AppDeleteModel copyWith({
    bool succeeded,
  }) =>
      AppDeleteModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
