/// Forget all receive model class
abstract class ForgetAllReceiveModel {
  /// Initializes
  ForgetAllReceiveModel({
    @required this.forgetAll,
  });

  /// IDs of the cancelled streams
  final List<dynamic> forgetAll;
}

/// Forget all receive class
class ForgetAllReceive extends ForgetAllReceiveModel {
  /// Initializes
  ForgetAllReceive({
    @required List<dynamic> forgetAll,
  }) : super(
          forgetAll: forgetAll,
        );

  /// Creates an instance from JSON
  factory ForgetAllReceive.fromJson(Map<String, dynamic> json) =>
      ForgetAllReceive();

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['forget_all'] = forgetAll;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ForgetAllReceive copyWith({
    List<dynamic> forgetAll,
  }) =>
      ForgetAllReceive(
        forgetAll: forgetAll ?? this.forgetAll,
      );
}
