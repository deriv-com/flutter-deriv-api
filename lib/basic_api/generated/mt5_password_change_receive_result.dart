/// Mt5 password change receive model class
abstract class Mt5PasswordChangeReceiveModel {
  /// Initializes
  Mt5PasswordChangeReceiveModel({
    @required this.mt5PasswordChange,
  });

  /// `1` on success
  final int mt5PasswordChange;
}

/// Mt5 password change receive class
class Mt5PasswordChangeReceive extends Mt5PasswordChangeReceiveModel {
  /// Initializes
  Mt5PasswordChangeReceive({
    @required int mt5PasswordChange,
  }) : super(
          mt5PasswordChange: mt5PasswordChange,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordChangeReceive.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordChangeReceive(
        mt5PasswordChange: json['mt5_password_change'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_password_change'] = mt5PasswordChange;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5PasswordChangeReceive copyWith({
    int mt5PasswordChange,
  }) =>
      Mt5PasswordChangeReceive(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
      );
}
