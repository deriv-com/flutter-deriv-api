/// Verify email receive model class
abstract class VerifyEmailReceiveModel {
  /// Initializes
  VerifyEmailReceiveModel({
    @required this.verifyEmail,
  });

  /// 1 for success (secure code has been sent to the email address)
  final bool verifyEmail;
}

/// Verify email receive class
class VerifyEmailReceive extends VerifyEmailReceiveModel {
  /// Initializes
  VerifyEmailReceive({
    @required bool verifyEmail,
  }) : super(
          verifyEmail: verifyEmail,
        );

  /// Creates an instance from JSON
  factory VerifyEmailReceive.fromJson(Map<String, dynamic> json) =>
      VerifyEmailReceive(
        verifyEmail: getBool(json['verify_email']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['verify_email'] = verifyEmail;

    return result;
  }

  /// Creates a copy of instance with given parameters
  VerifyEmailReceive copyWith({
    bool verifyEmail,
  }) =>
      VerifyEmailReceive(
        verifyEmail: verifyEmail ?? this.verifyEmail,
      );
}
