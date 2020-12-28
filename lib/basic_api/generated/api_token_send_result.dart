/// Api token send model class
abstract class ApiTokenSendModel {
  /// Initializes
  ApiTokenSendModel({
    @required this.apiToken,
    this.deleteToken,
    this.newToken,
    this.newTokenScopes,
    this.validForCurrentIpOnly,
  });

  /// Must be `1`
  final int apiToken;

  /// [Optional] The token to remove.
  final String deleteToken;

  /// [Optional] The name of the created token.
  final String newToken;

  /// [Optional] List of permission scopes to provide with the token.
  final List<NewTokenScopesEnum> newTokenScopes;

  /// [Optional] If you set this parameter during token creation, then the token created will only work for the IP address that was used to create the token
  final bool validForCurrentIpOnly;
}

/// Api token send class
class ApiTokenSend extends ApiTokenSendModel {
  /// Initializes
  ApiTokenSend({
    @required int apiToken,
    String deleteToken,
    String newToken,
    List<NewTokenScopesEnum> newTokenScopes,
    bool validForCurrentIpOnly,
  }) : super(
          apiToken: apiToken,
          deleteToken: deleteToken,
          newToken: newToken,
          newTokenScopes: newTokenScopes,
          validForCurrentIpOnly: validForCurrentIpOnly,
        );

  /// Creates an instance from JSON
  factory ApiTokenSend.fromJson(Map<String, dynamic> json) => ApiTokenSend(
        apiToken: json['api_token'],
        deleteToken: json['delete_token'],
        newToken: json['new_token'],
        newTokenScopes: List<NewTokenScopesEnum>.from(json['new_token_scopes']
            .map((x) => newTokenScopesEnumMapper.entries
                .firstWhere((entry) => entry.value == x, orElse: () => null)
                ?.key)),
        validForCurrentIpOnly: getBool(json['valid_for_current_ip_only']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['api_token'] = apiToken;
    result['delete_token'] = deleteToken;
    result['new_token'] = newToken;
    if (newTokenScopes != null) {
      result['new_token_scopes'] =
          newTokenScopes.map((item) => newTokenScopesEnumMapper[item]).toList();
    }
    result['valid_for_current_ip_only'] = validForCurrentIpOnly;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ApiTokenSend copyWith({
    int apiToken,
    String deleteToken,
    String newToken,
    List<NewTokenScopesEnum> newTokenScopes,
    bool validForCurrentIpOnly,
  }) =>
      ApiTokenSend(
        apiToken: apiToken ?? this.apiToken,
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        newTokenScopes: newTokenScopes ?? this.newTokenScopes,
        validForCurrentIpOnly:
            validForCurrentIpOnly ?? this.validForCurrentIpOnly,
      );
  // Creating Enum Mappers

  static final Map<NewTokenScopesEnum, String> newTokenScopesEnumMapper = {
    NewTokenScopesEnum.read: 'read',
    NewTokenScopesEnum.trade: 'trade',
    NewTokenScopesEnum.trading_information: 'trading_information',
    NewTokenScopesEnum.payments: 'payments',
    NewTokenScopesEnum.admin: 'admin',
  };
}

// Creating Enums

enum NewTokenScopesEnum {
  read,
  trade,
  trading_information,
  payments,
  admin,
}
