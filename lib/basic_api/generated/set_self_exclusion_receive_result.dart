/// Set self exclusion receive model class
abstract class SetSelfExclusionReceiveModel {
  /// Initializes
  SetSelfExclusionReceiveModel({
    @required this.setSelfExclusion,
  });

  /// `1` on success
  final int setSelfExclusion;
}

/// Set self exclusion receive class
class SetSelfExclusionReceive extends SetSelfExclusionReceiveModel {
  /// Initializes
  SetSelfExclusionReceive({
    @required int setSelfExclusion,
  }) : super(
          setSelfExclusion: setSelfExclusion,
        );

  /// Creates an instance from JSON
  factory SetSelfExclusionReceive.fromJson(Map<String, dynamic> json) =>
      SetSelfExclusionReceive(
        setSelfExclusion: json['set_self_exclusion'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_self_exclusion'] = setSelfExclusion;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SetSelfExclusionReceive copyWith({
    int setSelfExclusion,
  }) =>
      SetSelfExclusionReceive(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
      );
}
