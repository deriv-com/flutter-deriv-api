import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Copy trading stop model class
class CopyTradingStopModel extends BaseModel {
  /// Initializes
  CopyTradingStopModel({
    this.succeeded,
  });

  /// Generate an instance from json
  factory CopyTradingStopModel.fromJson(Map<String, dynamic> json) =>
      CopyTradingStopModel(
        succeeded: getBool(json['copy_stop']),
      );

  /// Copy start confirmation. Returns `true` is success.
  final bool succeeded;

  /// Generate a copy of instance with given parameters
  CopyTradingStopModel copyWith({
    bool succeeded,
  }) =>
      CopyTradingStopModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
