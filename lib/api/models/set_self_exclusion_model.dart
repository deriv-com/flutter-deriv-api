/// Set self exclusion model class
class SetSelfExclusionModel {
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
