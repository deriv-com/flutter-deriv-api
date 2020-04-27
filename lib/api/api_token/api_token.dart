import 'package:flutter_deriv_api/api/models/api_token_model.dart';
import 'package:flutter_deriv_api/api/models/token_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Token class
class APIToken extends APITokenModel {
  /// Class constructor
  APIToken({
    bool deleteToken,
    bool newToken,
    List<TokenModel> tokens,
  }) : super(
          deleteToken: deleteToken,
          newToken: newToken,
          tokens: tokens,
        );

  /// Creates instance from json
  factory APIToken.fromJson(Map<String, dynamic> json) => APIToken(
        deleteToken: getBool(json['delete_token']),
        newToken: getBool(json['new_token']),
        tokens: json['tokens'] == null
            ? null
            : json['tokens']
                .map<TokenModel>(
                  (dynamic item) => TokenModel.fromJson(item),
                )
                .toList(),
      );

  /// Creates copy of instance with given parameters
  APIToken copyWith({
    bool deleteToken,
    bool newToken,
    List<TokenModel> tokens,
  }) =>
      APIToken(
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        tokens: tokens ?? this.tokens,
      );
}
