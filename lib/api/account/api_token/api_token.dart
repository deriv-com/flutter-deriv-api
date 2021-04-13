import 'package:flutter_deriv_api/api/account/api_token/exceptions/api_token_exception.dart';
import 'package:flutter_deriv_api/api/account/models/api_token_model.dart';
import 'package:flutter_deriv_api/api/account/models/token_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// A class for handling API tokens
class APIToken extends APITokenModel {
  /// Initializes
  APIToken({
    bool? deleteToken,
    bool? newToken,
    List<TokenModel?>? tokens,
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

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  APIToken copyWith({
    bool? deleteToken,
    bool? newToken,
    List<TokenModel>? tokens,
  }) =>
      APIToken(
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        tokens: tokens ?? this.tokens,
      );

  /// Creates an API tokens
  ///
  /// [name] is the name of the token.
  /// [scopes] is a list of permission scopes to provide with the token.
  /// [validForCurrentIPOnly] is optional and if you set this parameter during token creation,
  /// then the token created will only work for the IP address that was used to create the token
  /// Throws an [APITokenException] if API response contains an error.
  static Future<APIToken> create({
    required String name,
    required List<TokenScope> scopes,
    required bool validForCurrentIPOnly,
  }) async {
    final ApiTokenResponse response = await _api!.call<ApiTokenResponse>(
      request: ApiTokenRequest(
        newToken: name,
        newTokenScopes: getStringListFromEnums(scopes),
        validForCurrentIpOnly: validForCurrentIPOnly,
      ),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          APITokenException(baseExceptionModel: baseExceptionModel),
    );

    return APIToken.fromJson(response.apiToken);
  }

  /// Deletes the [token]
  ///
  /// Throws an [APITokenException] if API response contains an error
  static Future<APIToken> delete({
    required String token,
  }) async {
    final ApiTokenResponse response = await _api!.call<ApiTokenResponse>(
      request: ApiTokenRequest(deleteToken: token),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          APITokenException(baseExceptionModel: baseExceptionModel),
    );

    return APIToken.fromJson(response.apiToken);
  }
}
