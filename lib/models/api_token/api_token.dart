import 'package:flutter_deriv_api/models/api_token/token.dart';

/// Api token model class
abstract class APITokenModel {
  /// Class constructor
  APITokenModel({
    this.deleteToken,
    this.newToken,
    this.tokens,
  });

  /// Token deleted.
  final int deleteToken;

  /// Token created.
  final int newToken;

  /// API tokens
  final List<TokenModel> tokens;
}
