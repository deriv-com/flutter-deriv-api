import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/token_model.dart';

/// Api token model class
abstract class APITokenModel extends BaseModel {
  /// Initializes
  APITokenModel({
    this.deleteToken,
    this.newToken,
    this.tokens,
  });

  /// Token deleted.
  final bool deleteToken;

  /// Token created.
  final bool newToken;

  /// API tokens
  final List<TokenModel> tokens;
}
