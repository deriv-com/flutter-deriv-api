/// Get limits send model class
abstract class GetLimitsSendModel {
  /// Initializes
  GetLimitsSendModel({
    @required this.getLimits,
  });

  /// Must be `1`
  final int getLimits;
}

/// Get limits send class
class GetLimitsSend extends GetLimitsSendModel {
  /// Initializes
  GetLimitsSend({
    @required int getLimits,
  }) : super(
          getLimits: getLimits,
        );

  /// Creates an instance from JSON
  factory GetLimitsSend.fromJson(Map<String, dynamic> json) => GetLimitsSend(
        getLimits: json['get_limits'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['get_limits'] = getLimits;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetLimitsSend copyWith({
    int getLimits,
  }) =>
      GetLimitsSend(
        getLimits: getLimits ?? this.getLimits,
      );
}
