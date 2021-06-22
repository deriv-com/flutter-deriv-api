part of 'login.dart';

///AppAuthorizationChallenge request model.
class AppAuthorizationChallengeRequest {
  /// Initializes AppAuthorizationChallenge request model.
  AppAuthorizationChallengeRequest({
    required this.appId,
  });

  /// Application id.
  final int appId;

  /// Converts a instance of this class to json.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
      };
}

/// AppAuthorizationChallenge response model.
class AppAuthorizationChallengeResponse {
  /// Initializes AppAuthorizationChallenge response model.
  AppAuthorizationChallengeResponse({
    required this.challenge,
    required this.expire,
  });

  /// Converts the provided json to instance of this class.
  factory AppAuthorizationChallengeResponse.fromJson(
          Map<String, dynamic> json) =>
      AppAuthorizationChallengeResponse(
        challenge: json['challenge'],
        expire: json['expire'],
      );

  /// expire in  timestamp.
  final int expire;

  /// challenge hash.
  final String challenge;
}
