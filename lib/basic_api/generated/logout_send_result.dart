/// Logout send model class
abstract class LogoutSendModel {
  /// Initializes
  LogoutSendModel({
    @required this.logout,
  });

  /// Must be `1`
  final int logout;
}

/// Logout send class
class LogoutSend extends LogoutSendModel {
  /// Initializes
  LogoutSend({
    @required int logout,
  }) : super(
          logout: logout,
        );

  /// Creates an instance from JSON
  factory LogoutSend.fromJson(Map<String, dynamic> json) => LogoutSend(
        logout: json['logout'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['logout'] = logout;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LogoutSend copyWith({
    int logout,
  }) =>
      LogoutSend(
        logout: logout ?? this.logout,
      );
}
