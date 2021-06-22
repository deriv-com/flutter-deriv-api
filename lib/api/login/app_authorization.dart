part of 'login.dart';

///AppAuthorization request model.
class AppAuthorizationRequest {
  /// Initializes AppAuthorization request model.
  AppAuthorizationRequest({
    required this.appId,
    required this.solution,
    required this.expire,
  });

  /// Application id.
  final int appId;

  /// Solution.
  final String solution;

  /// expire in timestamp.
  final int expire;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'solution': solution,
        'expire': expire,
      };
}

///AppAuthorization response model.
class AppAuthorizationResponse {
  /// Initializes AppAuthorization response model.
  AppAuthorizationResponse({
    required this.token,
  });

  /// Converts the provided json to instance of this class.
  factory AppAuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      AppAuthorizationResponse(
        token: json['token'],
      );

  /// JWT token.
  final String token;
}
