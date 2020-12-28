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
  final List<Token> tokens;
}

/// Api token class
class ApiToken extends ApiTokenModel {
  /// Initializes
  ApiToken({
    @required int deleteToken,
    @required int newToken,
    @required List<Token> tokens,
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
            : json['tokens']
                .map<Token>((dynamic item) => Token.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['delete_token'] = deleteToken;
    result['new_token'] = newToken;
    if (tokens != null) {
      result['tokens'] = tokens.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ApiToken copyWith({
    int deleteToken,
    int newToken,
    List<Token> tokens,
  }) =>
      ApiToken(
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        tokens: tokens ?? this.tokens,
      );
}
/// Token model class
abstract class TokenModel {
  /// Initializes
  TokenModel({
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
  final List<ScopesEnum> scopes;

  /// The token that can be used to `authorize` with.
  final String token;

  /// The IP restriction for the token. No restriction if empty.
  final String validForIp;
}

/// Token class
class Token extends TokenModel {
  /// Initializes
  Token({
    @required String displayName,
    @required String lastUsed,
    @required List<ScopesEnum> scopes,
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
  factory Token.fromJson(Map<String, dynamic> json) => Token(
        displayName: json['display_name'],
        lastUsed: json['last_used'],
        scopes: List<ScopesEnum>.from(json['scopes'].map((x) => scopesEnumMapper
            .entries
            .firstWhere((entry) => entry.value == x, orElse: () => null)
            ?.key)),
        token: json['token'],
        validForIp: json['valid_for_ip'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['last_used'] = lastUsed;
    if (scopes != null) {
      result['scopes'] = scopes.map((item) => scopesEnumMapper[item]).toList();
    }
    result['token'] = token;
    result['valid_for_ip'] = validForIp;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Token copyWith({
    String displayName,
    String lastUsed,
    List<ScopesEnum> scopes,
    String token,
    String validForIp,
  }) =>
      Token(
        displayName: displayName ?? this.displayName,
        lastUsed: lastUsed ?? this.lastUsed,
        scopes: scopes ?? this.scopes,
        token: token ?? this.token,
        validForIp: validForIp ?? this.validForIp,
      );
  // Creating Enum Mappers

  static final Map<ScopesEnum, String> scopesEnumMapper = {
    ScopesEnum.read: 'read',
    ScopesEnum.trade: 'trade',
    ScopesEnum.trading_information: 'trading_information',
    ScopesEnum.payments: 'payments',
    ScopesEnum.admin: 'admin',
  };
}

// Creating Enums

enum ScopesEnum {
  read,
  trade,
  trading_information,
  payments,
  admin,
}
