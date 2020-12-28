/// Forget receive model class
abstract class ForgetReceiveModel {
  /// Initializes
  ForgetReceiveModel({
    @required this.forget,
  });

  /// If set to `true`, stream exited and stopped. If set to `false`, stream did not exist.
  final bool forget;
}

/// Forget receive class
class ForgetReceive extends ForgetReceiveModel {
  /// Initializes
  ForgetReceive({
    @required bool forget,
  }) : super(
          forget: forget,
        );

  /// Creates an instance from JSON
  factory ForgetReceive.fromJson(Map<String, dynamic> json) => ForgetReceive(
        forget: getBool(json['forget']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['forget'] = forget;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ForgetReceive copyWith({
    bool forget,
  }) =>
      ForgetReceive(
        forget: forget ?? this.forget,
      );
}
