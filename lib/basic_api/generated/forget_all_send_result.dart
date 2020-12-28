/// Forget all send model class
abstract class ForgetAllSendModel {
  /// Initializes
  ForgetAllSendModel({
    @required this.forgetAll,
  });

  /// Cancel all streams by type. The value can be either a single type e.g. `"ticks"`, or an array of multiple types e.g. `["candles", "ticks"]`.
  final UNKNOWN_TYPE forgetAll;
}

/// Forget all send class
class ForgetAllSend extends ForgetAllSendModel {
  /// Initializes
  ForgetAllSend({
    @required UNKNOWN_TYPE forgetAll,
  }) : super(
          forgetAll: forgetAll,
        );

  /// Creates an instance from JSON
  factory ForgetAllSend.fromJson(Map<String, dynamic> json) => ForgetAllSend(
        forgetAll: json['forget_all'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['forget_all'] = forgetAll;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ForgetAllSend copyWith({
    UNKNOWN_TYPE forgetAll,
  }) =>
      ForgetAllSend(
        forgetAll: forgetAll ?? this.forgetAll,
      );
}
