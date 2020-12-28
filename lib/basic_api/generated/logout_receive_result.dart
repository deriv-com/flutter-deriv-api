/// Logout receive model class
abstract class LogoutReceiveModel {
  /// Initializes
  LogoutReceiveModel({
    @required this.logout,
  });

  /// The result of logout request which is 1
  final int logout;
}

/// Logout receive class
class LogoutReceive extends LogoutReceiveModel {
  /// Initializes
  LogoutReceive({
    @required int logout,
  }) : super(
          logout: logout,
        );

  /// Creates an instance from JSON
  factory LogoutReceive.fromJson(Map<String, dynamic> json) => LogoutReceive(
        logout: json['logout'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['logout'] = logout;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LogoutReceive copyWith({
    int logout,
  }) =>
      LogoutReceive(
        logout: logout ?? this.logout,
      );
}
