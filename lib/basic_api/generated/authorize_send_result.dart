/// Authorize send model class
abstract class AuthorizeSendModel {
  /// Initializes
  AuthorizeSendModel({
    @required this.authorize,
    this.addToLoginHistory,
  });

  /// Authentication token. May be retrieved from https://www.binary.com/en/user/security/api_tokenws.html
  final String authorize;

  /// [Optional] Send this when you use api tokens for authorization and want to track activity using `login_history` call.
  final bool addToLoginHistory;
}

/// Authorize send class
class AuthorizeSend extends AuthorizeSendModel {
  /// Initializes
  AuthorizeSend({
    @required String authorize,
    bool addToLoginHistory,
  }) : super(
          authorize: authorize,
          addToLoginHistory: addToLoginHistory,
        );

  /// Creates an instance from JSON
  factory AuthorizeSend.fromJson(Map<String, dynamic> json) => AuthorizeSend(
        authorize: json['authorize'],
        addToLoginHistory: getBool(json['add_to_login_history']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['authorize'] = authorize;
    result['add_to_login_history'] = addToLoginHistory;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AuthorizeSend copyWith({
    String authorize,
    bool addToLoginHistory,
  }) =>
      AuthorizeSend(
        authorize: authorize ?? this.authorize,
        addToLoginHistory: addToLoginHistory ?? this.addToLoginHistory,
      );
}
