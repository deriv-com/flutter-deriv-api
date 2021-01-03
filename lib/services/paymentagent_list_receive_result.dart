import 'package:meta/meta.dart';

/// The model model class
abstract class TheModelModel {
  /// Initializes
  TheModelModel({
    @required this.apiToken,
  });

  /// Contains the result of API token according to the type of request.
  final ApiToken apiToken;
}

/// The model class
class TheModel extends TheModelModel {
  /// Initializes
  TheModel({
    @required ApiToken apiToken,
  }) : super(
          apiToken: apiToken,
        );

  /// Creates an instance from JSON
  factory TheModel.fromJson(Map<String, dynamic> json) => TheModel(
        apiToken: json['api_token'] == null
            ? null
            : ApiToken.fromJson(json['api_token']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (apiToken != null) {
      result['api_token'] = apiToken.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TheModel copyWith({
    ApiToken apiToken,
  }) =>
      TheModel(
        apiToken: apiToken ?? this.apiToken,
      );
}

final Map<String, ScopesItemEnum> scopesItemEnumMapper = {
  r'read': ScopesItemEnum.read,
  r'trade': ScopesItemEnum.trade,
  r'trading_information': ScopesItemEnum.trading_information,
  r'payments': ScopesItemEnum.payments,
  r'admin': ScopesItemEnum.admin,
};

enum ScopesItemEnum {
  read,
  trade,
  trading_information,
  payments,
  admin,
}
/// Api token model class
abstract class ApiTokenModel {
  /// Initializes
  ApiTokenModel({
    @required this.deleteToken,
    @required this.newToken,
    @required this.tokens,
  });

  /// Token deleted.
  final int deleteToken;

  /// Token created.
  final int newToken;

  /// API tokens
  final List<TokensItem> tokens;
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['delete_token'] = deleteToken;
    result['new_token'] = newToken;
    if (tokens != null) {
      result['tokens'] =
          tokens.map((TokensItem item) => item.toJson()).toList();
    }

    return result;
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
    @required this.displayName,
    @required this.lastUsed,
    @required this.scopes,
    @required this.token,
    @required this.validForIp,
  });

  /// The token name specified when creating.
  final String displayName;

  /// The last date which the token has been used.
  final String lastUsed;

  /// List of permission scopes of the token.
  final List<ScopesItemEnum> scopes;

  /// The token that can be used to `authorize` with.
  final String token;

  /// The IP restriction for the token. No restriction if empty.
  final String validForIp;
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['last_used'] = lastUsed;
    if (scopes != null) {
      result['scopes'] = scopes
          .map((ScopesItemEnum item) => scopesItemEnumMapper.entries
              .firstWhere((entry) => entry.value == item, orElse: () => null)
              ?.key)
          .toList();
    }
    result['token'] = token;
    result['valid_for_ip'] = validForIp;

    return result;
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
