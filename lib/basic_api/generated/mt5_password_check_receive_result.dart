/// Mt5 password check receive model class
abstract class Mt5PasswordCheckReceiveModel {
  /// Initializes
  Mt5PasswordCheckReceiveModel({
    @required this.mt5PasswordCheck,
  });

  /// `1` on success
  final int mt5PasswordCheck;
}

/// Mt5 password check receive class
class Mt5PasswordCheckReceive extends Mt5PasswordCheckReceiveModel {
  /// Initializes
  Mt5PasswordCheckReceive({
    @required int mt5PasswordCheck,
  }) : super(
          mt5PasswordCheck: mt5PasswordCheck,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordCheckReceive.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordCheckReceive(
        mt5PasswordCheck: json['mt5_password_check'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_password_check'] = mt5PasswordCheck;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5PasswordCheckReceive copyWith({
    int mt5PasswordCheck,
  }) =>
      Mt5PasswordCheckReceive(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
      );
}
