part 'app_authorization_challenge.dart';
part 'app_authorization.dart';

/// Login request model
class LoginRequest {
  ///Initializes LoginRequest.
  LoginRequest({
    required this.type,
    required this.email,
    required this.password,
    required this.appId,
  });

  /// Type of login, it can either be `system` or `social`.
  final String type;

  /// Email address
  final String email;

  /// Password
  final String password;

  /// application id
  final int appId;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'email': email,
        'password': password,
        'app_id': appId,
      };
}

/// Login Response.
class LoginResponse {
  /// Initializes login response.
  LoginResponse({
    required this.tokens,
  });

  /// Converts the provided json to instance of this class.
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        tokens: List<Token>.from(
            json['tokens'].map((Map<String, dynamic> x) => Token.fromJson(x))),
      );

  /// List of available tokens for logged in user.
  final List<Token> tokens;
}

/// Token Model
class Token {
  /// Initializes token model.
  Token({
    required this.loginid,
    required this.token,
  });

  /// Converts the provided json to instance of this class.
  factory Token.fromJson(Map<String, dynamic> json) => Token(
        loginid: json['loginid'],
        token: json['token'],
      );

  /// Login ID of logged in user.
  final String loginid;

  /// Token of logged in user.
  final String token;
}
