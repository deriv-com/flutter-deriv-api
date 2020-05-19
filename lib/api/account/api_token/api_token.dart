import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/account/api_token/exceptions/api_token_exception.dart';
import 'package:flutter_deriv_api/api/account/models/api_token_model.dart';
import 'package:flutter_deriv_api/api/account/models/token_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// API token class
class APIToken extends APITokenModel {
  /// Initializes
  APIToken({
    bool deleteToken,
    bool newToken,
    List<TokenModel> tokens,
  }) : super(
          deleteToken: deleteToken,
          newToken: newToken,
          tokens: tokens,
        );

  /// Creates an instance from JSON
  factory APIToken.fromJson(Map<String, dynamic> json) => APIToken(
        deleteToken: getBool(json['delete_token']),
        newToken: getBool(json['new_token']),
        tokens: getListFromMap(
          json['tokens'],
          itemToTypeCallback: (dynamic item) => TokenModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
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

  /// Creates an API tokens
  static Future<APIToken> create({
    @required String name,
    @required List<TokenScope> scopes,
    bool validForCurrentIPOnly,
  }) async {
    final ApiTokenResponse response = await _api.call(
      request: ApiTokenRequest(
        newToken: name,
        newTokenScopes: getStringListFromEnums(scopes),
        validForCurrentIpOnly: getInt(validForCurrentIPOnly),
      ),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) => APITokenException(
        message: message,
      ),
    );

    return APIToken.fromJson(response.apiToken);
  }

  /// Deletes an API tokens
  static Future<APIToken> delete({
    @required String token,
  }) async {
    final ApiTokenResponse response = await _api.call(
      request: ApiTokenRequest(deleteToken: token),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) => APITokenException(
        message: message,
      ),
    );

    return APIToken.fromJson(response.apiToken);
  }
}
