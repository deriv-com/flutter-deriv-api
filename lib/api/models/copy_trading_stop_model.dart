import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Copy trading stop model class
class CopyTradingStopModel extends BaseModel {
  /// Initializes
  CopyTradingStopModel({
    this.copyStart,
  });

  /// Generate an instance from json
  factory CopyTradingStopModel.fromJson(Map<String, dynamic> json) =>
      CopyTradingStopModel(
        copyStart: getBool(json['copy_stop']),
      );

  /// Copy start confirmation. Returns `true` is success.
  final bool copyStart;

  /// Generate a copy of instance with given parameters
  CopyTradingStopModel copyWith({
    bool copyStart,
  }) =>
      CopyTradingStopModel(
        copyStart: copyStart ?? this.copyStart,
      );
}
