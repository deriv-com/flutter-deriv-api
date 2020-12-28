/// Mt5 password reset receive model class
abstract class Mt5PasswordResetReceiveModel {
  /// Initializes
  Mt5PasswordResetReceiveModel({
    @required this.mt5PasswordReset,
  });

  /// `1` on success
  final int mt5PasswordReset;
}

/// Mt5 password reset receive class
class Mt5PasswordResetReceive extends Mt5PasswordResetReceiveModel {
  /// Initializes
  Mt5PasswordResetReceive({
    @required int mt5PasswordReset,
  }) : super(
          mt5PasswordReset: mt5PasswordReset,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordResetReceive.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordResetReceive(
        mt5PasswordReset: json['mt5_password_reset'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_password_reset'] = mt5PasswordReset;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5PasswordResetReceive copyWith({
    int mt5PasswordReset,
  }) =>
      Mt5PasswordResetReceive(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
      );
}
