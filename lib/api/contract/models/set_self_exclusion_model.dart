import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Set self exclusion model class
class SetSelfExclusionModel extends APIBaseModel {
  /// Initializes
  SetSelfExclusionModel({
    this.setSelfExclusion,
  });

  /// Generates an instance from json
  factory SetSelfExclusionModel.fromJson(Map<String, dynamic> json) =>
      SetSelfExclusionModel(
        setSelfExclusion: getBool(json['set_self_exclusion']),
      );

  /// `true` on success
  final bool setSelfExclusion;

  /// Creates copy of instance with given parameters
  SetSelfExclusionModel copyWith({
    int setSelfExclusion,
  }) =>
      SetSelfExclusionModel(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
      );
}
