import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Set self exclusion model class
class SetSelfExclusionModel extends BaseModel {
  /// Class constructor
  SetSelfExclusionModel({
    this.setSelfExclusion,
  });

  /// Creates instance from json
  factory SetSelfExclusionModel.fromJson(Map<String, dynamic> json) =>
      SetSelfExclusionModel(
        setSelfExclusion: json['set_self_exclusion'],
      );

  /// `1` on success
  final int setSelfExclusion;

  /// Creates copy of instance with given parameters
  SetSelfExclusionModel copyWith({
    int setSelfExclusion,
  }) =>
      SetSelfExclusionModel(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
      );
}
