/// Get self exclusion send model class
abstract class GetSelfExclusionSendModel {
  /// Initializes
  GetSelfExclusionSendModel({
    @required this.getSelfExclusion,
  });

  /// Must be `1`
  final int getSelfExclusion;
}

/// Get self exclusion send class
class GetSelfExclusionSend extends GetSelfExclusionSendModel {
  /// Initializes
  GetSelfExclusionSend({
    @required int getSelfExclusion,
  }) : super(
          getSelfExclusion: getSelfExclusion,
        );

  /// Creates an instance from JSON
  factory GetSelfExclusionSend.fromJson(Map<String, dynamic> json) =>
      GetSelfExclusionSend(
        getSelfExclusion: json['get_self_exclusion'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['get_self_exclusion'] = getSelfExclusion;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetSelfExclusionSend copyWith({
    int getSelfExclusion,
  }) =>
      GetSelfExclusionSend(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
      );
}
