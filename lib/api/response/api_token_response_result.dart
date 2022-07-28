// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/api_token_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/api_token_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Api token response model class.
abstract class ApiTokenResponseModel {
  /// Initializes Api token response model class .
  const ApiTokenResponseModel({
    this.apiToken,
  });

  /// Contains the result of API token according to the type of request.
  final ApiToken? apiToken;
}

/// Api token response class.
class ApiTokenResponse extends ApiTokenResponseModel {
  /// Initializes Api token response class.
  const ApiTokenResponse({
    ApiToken? apiToken,
  }) : super(
          apiToken: apiToken,
        );

  /// Creates an instance from JSON.
  factory ApiTokenResponse.fromJson(
    dynamic apiTokenJson,
  ) =>
      ApiTokenResponse(
        apiToken: apiTokenJson == null ? null : ApiToken.fromJson(apiTokenJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (apiToken != null) {
      resultMap['api_token'] = apiToken!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates an API tokens
  ///
  /// [name] is the name of the token.
  /// [scopes] is a list of permission scopes to provide with the token.
  /// [validForCurrentIPOnly] is optional and if you set this parameter during token creation,
  /// then the token created will only work for the IP address that was used to create the token
  /// Throws an [APITokenException] if API response contains an error.
  static Future<ApiTokenResponse> create({
    required String name,
    required List<ScopesItemEnum> scopes,
    bool? validForCurrentIPOnly,
  }) async {
    final ApiTokenReceive response = await _api.call(
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

    return ApiTokenResponse.fromJson(response.apiToken);
  }

  /// Deletes the [token]
  ///
  /// Throws an [APITokenException] if API response contains an error
  static Future<ApiTokenResponse> delete({
    required String token,
  }) async {
    final ApiTokenReceive response = await _api.call(
      request: ApiTokenRequest(deleteToken: token),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          APITokenException(baseExceptionModel: baseExceptionModel),
    );

    return ApiTokenResponse.fromJson(response.apiToken);
  }

  /// Creates a copy of instance with given parameters.
  ApiTokenResponse copyWith({
    ApiToken? apiToken,
  }) =>
      ApiTokenResponse(
        apiToken: apiToken ?? this.apiToken,
      );
}

/// ScopesItemEnum mapper.
final Map<String, ScopesItemEnum> scopesItemEnumMapper =
    <String, ScopesItemEnum>{
  "read": ScopesItemEnum.read,
  "trade": ScopesItemEnum.trade,
  "trading_information": ScopesItemEnum.tradingInformation,
  "payments": ScopesItemEnum.payments,
  "admin": ScopesItemEnum.admin,
};

/// ScopesItem Enum.
enum ScopesItemEnum {
  /// read.
  read,

  /// trade.
  trade,

  /// trading_information.
  tradingInformation,

  /// payments.
  payments,

  /// admin.
  admin,
}
/// Api token model class.
abstract class ApiTokenModel {
  /// Initializes Api token model class .
  const ApiTokenModel({
    this.deleteToken,
    this.newToken,
    this.tokens,
  });

  /// Token deleted.
  final int? deleteToken;

  /// Token created.
  final int? newToken;

  /// API tokens
  final List<TokensItem>? tokens;
}

/// Api token class.
class ApiToken extends ApiTokenModel {
  /// Initializes Api token class.
  const ApiToken({
    int? deleteToken,
    int? newToken,
    List<TokensItem>? tokens,
  }) : super(
          deleteToken: deleteToken,
          newToken: newToken,
          tokens: tokens,
        );

  /// Creates an instance from JSON.
  factory ApiToken.fromJson(Map<String, dynamic> json) => ApiToken(
        deleteToken: json['delete_token'],
        newToken: json['new_token'],
        tokens: json['tokens'] == null
            ? null
            : List<TokensItem>.from(
                json['tokens']?.map(
                  (dynamic item) => TokensItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['delete_token'] = deleteToken;
    resultMap['new_token'] = newToken;
    if (tokens != null) {
      resultMap['tokens'] = tokens!
          .map<dynamic>(
            (TokensItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ApiToken copyWith({
    int? deleteToken,
    int? newToken,
    List<TokensItem>? tokens,
  }) =>
      ApiToken(
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        tokens: tokens ?? this.tokens,
      );
}
/// Tokens item model class.
abstract class TokensItemModel {
  /// Initializes Tokens item model class .
  const TokensItemModel({
    this.displayName,
    this.lastUsed,
    this.scopes,
    this.token,
    this.validForIp,
  });

  /// The token name specified when creating.
  final String? displayName;

  /// The last date which the token has been used.
  final String? lastUsed;

  /// List of permission scopes of the token.
  final List<ScopesItemEnum>? scopes;

  /// The token that can be used to `authorize` with.
  final String? token;

  /// The IP restriction for the token. No restriction if empty.
  final String? validForIp;
}

/// Tokens item class.
class TokensItem extends TokensItemModel {
  /// Initializes Tokens item class.
  const TokensItem({
    String? displayName,
    String? lastUsed,
    List<ScopesItemEnum>? scopes,
    String? token,
    String? validForIp,
  }) : super(
          displayName: displayName,
          lastUsed: lastUsed,
          scopes: scopes,
          token: token,
          validForIp: validForIp,
        );

  /// Creates an instance from JSON.
  factory TokensItem.fromJson(Map<String, dynamic> json) => TokensItem(
        displayName: json['display_name'],
        lastUsed: json['last_used'],
        scopes: json['scopes'] == null
            ? null
            : List<ScopesItemEnum>.from(
                json['scopes']?.map(
                  (dynamic item) =>
                      item == null ? null : scopesItemEnumMapper[item],
                ),
              ),
        token: json['token'],
        validForIp: json['valid_for_ip'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['last_used'] = lastUsed;
    if (scopes != null) {
      resultMap['scopes'] = scopes!
          .map<dynamic>(
            (ScopesItemEnum item) => scopesItemEnumMapper.entries
                .firstWhere((MapEntry<String, ScopesItemEnum> entry) =>
                    entry.value == item)
                .key,
          )
          .toList();
    }
    resultMap['token'] = token;
    resultMap['valid_for_ip'] = validForIp;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TokensItem copyWith({
    String? displayName,
    String? lastUsed,
    List<ScopesItemEnum>? scopes,
    String? token,
    String? validForIp,
  }) =>
      TokensItem(
        displayName: displayName ?? this.displayName,
        lastUsed: lastUsed ?? this.lastUsed,
        scopes: scopes ?? this.scopes,
        token: token ?? this.token,
        validForIp: validForIp ?? this.validForIp,
      );
}
