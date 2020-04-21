import 'package:flutter_deriv_api/api/models/token.dart';
import 'package:flutter_deriv_api/api/models/api_token.dart';

/// Token class
class APIToken extends APITokenModel {
  /// Class constructor
  APIToken({
    int deleteToken,
    int newToken,
    List<TokenModel> tokens,
  }) : super(
          deleteToken: deleteToken,
          newToken: newToken,
          tokens: tokens,
        );

  /// Creates instance from json
  factory APIToken.fromJson(Map<String, dynamic> json) => APIToken(
        deleteToken: json['delete_token'],
        newToken: json['new_token'],
        tokens: json['tokens'] == null
            ? null
            : json['tokens']
                .map<TokenModel>(
                  (Map<String, dynamic> item) => TokenModel.fromJson(item),
                )
                .toList(),
      );

  /// Creates copy of instance with given parameters
  APIToken copyWith({
    int deleteToken,
    int newToken,
    List<TokenModel> tokens,
  }) =>
      APIToken(
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        tokens: tokens ?? this.tokens,
      );
}
