/// Login history send model class
abstract class LoginHistorySendModel {
  /// Initializes
  LoginHistorySendModel({
    @required this.loginHistory,
    this.limit,
  });

  /// Must be `1`
  final int loginHistory;

  /// [Optional] Apply limit to count of login history records.
  final int limit;
}

/// Login history send class
class LoginHistorySend extends LoginHistorySendModel {
  /// Initializes
  LoginHistorySend({
    @required int loginHistory,
    int limit,
  }) : super(
          loginHistory: loginHistory,
          limit: limit,
        );

  /// Creates an instance from JSON
  factory LoginHistorySend.fromJson(Map<String, dynamic> json) =>
      LoginHistorySend(
        loginHistory: json['login_history'],
        limit: json['limit'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['login_history'] = loginHistory;
    result['limit'] = limit;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LoginHistorySend copyWith({
    int loginHistory,
    int limit,
  }) =>
      LoginHistorySend(
        loginHistory: loginHistory ?? this.loginHistory,
        limit: limit ?? this.limit,
      );
}
