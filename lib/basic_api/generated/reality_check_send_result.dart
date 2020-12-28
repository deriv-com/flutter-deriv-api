/// Reality check send model class
abstract class RealityCheckSendModel {
  /// Initializes
  RealityCheckSendModel({
    @required this.realityCheck,
  });

  /// Must be `1`
  final int realityCheck;
}

/// Reality check send class
class RealityCheckSend extends RealityCheckSendModel {
  /// Initializes
  RealityCheckSend({
    @required int realityCheck,
  }) : super(
          realityCheck: realityCheck,
        );

  /// Creates an instance from JSON
  factory RealityCheckSend.fromJson(Map<String, dynamic> json) =>
      RealityCheckSend(
        realityCheck: json['reality_check'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['reality_check'] = realityCheck;

    return result;
  }

  /// Creates a copy of instance with given parameters
  RealityCheckSend copyWith({
    int realityCheck,
  }) =>
      RealityCheckSend(
        realityCheck: realityCheck ?? this.realityCheck,
      );
}
