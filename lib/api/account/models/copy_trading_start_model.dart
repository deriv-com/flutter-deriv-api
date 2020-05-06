import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Copy trading start model class
class CopyTradingStartModel extends APIBaseModel {
  /// Initializes
  CopyTradingStartModel({
    this.succeeded,
  });

  /// Generate an instance from JSON
  factory CopyTradingStartModel.fromJson(Map<String, dynamic> json) =>
      CopyTradingStartModel(
        succeeded: getBool(json['copy_start']),
      );

  /// Copy start confirmation. Returns `true` is success.
  final bool succeeded;

  /// Generate a copy of instance with given parameters
  CopyTradingStartModel copyWith({
    bool succeeded,
  }) =>
      CopyTradingStartModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
