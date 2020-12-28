/// Forget send model class
abstract class ForgetSendModel {
  /// Initializes
  ForgetSendModel({
    @required this.forget,
  });

  /// ID of the real-time stream of messages to cancel.
  final String forget;
}

/// Forget send class
class ForgetSend extends ForgetSendModel {
  /// Initializes
  ForgetSend({
    @required String forget,
  }) : super(
          forget: forget,
        );

  /// Creates an instance from JSON
  factory ForgetSend.fromJson(Map<String, dynamic> json) => ForgetSend(
        forget: json['forget'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['forget'] = forget;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ForgetSend copyWith({
    String forget,
  }) =>
      ForgetSend(
        forget: forget ?? this.forget,
      );
}
