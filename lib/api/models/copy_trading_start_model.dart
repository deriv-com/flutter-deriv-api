import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Copy trading start model class
class CopyTradingStartModel extends BaseModel {
  /// Initializes
  CopyTradingStartModel({
    this.copyStart,
  });

  /// Generate an instance from json
  factory CopyTradingStartModel.fromJson(Map<String, dynamic> json) =>
      CopyTradingStartModel(
        copyStart: getBool(json['copy_start']),
      );

  /// Copy start confirmation. Returns `true` is success.
  final bool copyStart;

  /// Generate a copy of instance with given parameters
  CopyTradingStartModel copyWith({
    bool copyStart,
  }) =>
      CopyTradingStartModel(
        copyStart: copyStart ?? this.copyStart,
      );
}
