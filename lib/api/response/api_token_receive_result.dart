import 'package:meta/meta.dart';

import '../../basic_api/generated/api_token_receive.dart';
import '../../basic_api/generated/api_token_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Api token response model class
abstract class ApiTokenResponseModel {
  /// Initializes
  ApiTokenResponseModel({
    @required this.apiToken,
  });

  /// Contains the result of API token according to the type of request.
  final ApiToken apiToken;
}

/// Api token response class
class ApiTokenResponse extends ApiTokenResponseModel {
  /// Initializes
  ApiTokenResponse({
    @required ApiToken apiToken,
  }) : super(
          apiToken: apiToken,
        );

  /// Creates an instance from JSON
  factory ApiTokenResponse.fromJson(
    dynamic apiTokenJson,
  ) =>
      ApiTokenResponse(
        apiToken: apiTokenJson == null ? null : ApiToken.fromJson(apiTokenJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (apiToken != null) {
      resultMap['api_token'] = apiToken.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates an API tokens
  ///
  /// [name] is the name of the token.
  /// [scopes] is a list of permission scopes to provide with the token.
  /// [validForCurrentIPOnly] is optional and if you set this parameter during token creation,
  /// then the token created will only work for the IP address that was used to create the token
  /// Throws an [APITokenException] if API response contains an error.
  static Future<ApiTokenResponse> create({
    @required String name,
    @required List<ScopesItemEnum> scopes,
    bool validForCurrentIPOnly,
  }) async {
    final ApiTokenReceive response = await _api.call(
      request: ApiTokenSend(
        newToken: name,
        newTokenScopes: getStringListFromEnums(
            scopes), // TODO(mohammad) enum to string fnuction should work properly
        validForCurrentIpOnly: validForCurrentIPOnly,
      ),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          APITokenException(baseExceptionModel: baseExceptionModel),
    );

    return ApiTokenResponse.fromJson(response.apiToken);
  }

  /// Deletes the [token]
  ///
  /// Throws an [APITokenException] if API response contains an error
  static Future<ApiTokenResponse> delete({
    @required String token,
  }) async {
    final ApiTokenReceive response = await _api.call(
      request: ApiTokenSend(deleteToken: token),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          APITokenException(baseExceptionModel: baseExceptionModel),
    );

    return ApiTokenResponse.fromJson(response.apiToken);
  }

  /// Creates a copy of instance with given parameters
  ApiTokenResponse copyWith({
    ApiToken apiToken,
  }) =>
      ApiTokenResponse(
        apiToken: apiToken ?? this.apiToken,
      );
}

final Map<String, ScopesItemEnum> scopesItemEnumMapper =
    <String, ScopesItemEnum>{
  "read": ScopesItemEnum.read,
  "trade": ScopesItemEnum.trade,
  "trading_information": ScopesItemEnum.tradingInformation,
  "payments": ScopesItemEnum.payments,
  "admin": ScopesItemEnum.admin,
};

/// scopesItem Enum
enum ScopesItemEnum {
  read,
  trade,
  tradingInformation,
  payments,
  admin,
}
/// Api token model class
abstract class ApiTokenModel {
  /// Initializes
  ApiTokenModel({
    @required this.tokens,
    @required this.newToken,
    @required this.deleteToken,
  });

  /// API tokens
  final List<TokensItem> tokens;

  /// Token created.
  final int newToken;

  /// Token deleted.
  final int deleteToken;
}

/// Api token class
class ApiToken extends ApiTokenModel {
  /// Initializes
  ApiToken({
    @required int deleteToken,
    @required int newToken,
    @required List<TokensItem> tokens,
  }) : super(
          deleteToken: deleteToken,
          newToken: newToken,
          tokens: tokens,
        );

  /// Creates an instance from JSON
  factory ApiToken.fromJson(Map<String, dynamic> json) => ApiToken(
        deleteToken: json['delete_token'],
        newToken: json['new_token'],
        tokens: json['tokens'] == null
            ? null
            : List<TokensItem>.from(json['tokens']
                .map((dynamic item) => TokensItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['delete_token'] = deleteToken;
    resultMap['new_token'] = newToken;
    if (tokens != null) {
      resultMap['tokens'] =
          tokens.map<dynamic>((TokensItem item) => item.toJson()).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ApiToken copyWith({
    int deleteToken,
    int newToken,
    List<TokensItem> tokens,
  }) =>
      ApiToken(
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        tokens: tokens ?? this.tokens,
      );
}
/// Tokens item model class
abstract class TokensItemModel {
  /// Initializes
  TokensItemModel({
    @required this.validForIp,
    @required this.token,
    @required this.scopes,
    @required this.lastUsed,
    @required this.displayName,
  });

  /// The IP restriction for the token. No restriction if empty.
  final String validForIp;

  /// The token that can be used to `authorize` with.
  final String token;

  /// List of permission scopes of the token.
  final List<ScopesItemEnum> scopes;

  /// The last date which the token has been used.
  final String lastUsed;

  /// The token name specified when creating.
  final String displayName;
}

/// Tokens item class
class TokensItem extends TokensItemModel {
  /// Initializes
  TokensItem({
    @required String displayName,
    @required String lastUsed,
    @required List<ScopesItemEnum> scopes,
    @required String token,
    @required String validForIp,
  }) : super(
          displayName: displayName,
          lastUsed: lastUsed,
          scopes: scopes,
          token: token,
          validForIp: validForIp,
        );

  /// Creates an instance from JSON
  factory TokensItem.fromJson(Map<String, dynamic> json) => TokensItem(
        displayName: json['display_name'],
        lastUsed: json['last_used'],
        scopes: json['scopes'] == null
            ? null
            : List<ScopesItemEnum>.from(json['scopes']
                .map((dynamic item) => scopesItemEnumMapper[item])),
        token: json['token'],
        validForIp: json['valid_for_ip'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['last_used'] = lastUsed;
    if (scopes != null) {
      resultMap['scopes'] = scopes
          .map<dynamic>((ScopesItemEnum item) => scopesItemEnumMapper.entries
              .firstWhere((entry) => entry.value == item, orElse: () => null)
              ?.key)
          .toList();
    }
    resultMap['token'] = token;
    resultMap['valid_for_ip'] = validForIp;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TokensItem copyWith({
    String displayName,
    String lastUsed,
    List<ScopesItemEnum> scopes,
    String token,
    String validForIp,
  }) =>
      TokensItem(
        displayName: displayName ?? this.displayName,
        lastUsed: lastUsed ?? this.lastUsed,
        scopes: scopes ?? this.scopes,
        token: token ?? this.token,
        validForIp: validForIp ?? this.validForIp,
      );
}
