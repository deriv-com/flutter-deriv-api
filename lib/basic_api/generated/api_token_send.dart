/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/api_token_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// ApiTokenRequest class
class ApiTokenRequest extends Request {
  /// Initialize ApiTokenRequest
  const ApiTokenRequest({
    this.apiToken = true,
    this.deleteToken,
    this.newToken,
    this.newTokenScopes,
    this.validForCurrentIpOnly,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'api_token',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ApiTokenRequest.fromJson(Map<String, dynamic> json) =>
      ApiTokenRequest(
        apiToken: json['api_token'] == null ? null : json['api_token'] == 1,
        deleteToken: json['delete_token'] as String,
        newToken: json['new_token'] as String,
        newTokenScopes: (json['new_token_scopes'] as List)
            ?.map((dynamic item) => item as String)
            ?.toList(),
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        validForCurrentIpOnly: json['valid_for_current_ip_only'] == null
            ? null
            : json['valid_for_current_ip_only'] == 1,
      );

  /// Must be `true`
  final bool apiToken;

  /// [Optional] The token to remove.
  final String deleteToken;

  /// [Optional] The name of the created token.
  final String newToken;

  /// [Optional] List of permission scopes to provide with the token.
  final List<String> newTokenScopes;

  /// [Optional] If you set this parameter during token creation, then the token created will only work for the IP address that was used to create the token
  final bool validForCurrentIpOnly;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'api_token': apiToken == null ? null : apiToken ? 1 : 0,
        'delete_token': deleteToken,
        'new_token': newToken,
        'new_token_scopes': newTokenScopes,
        'passthrough': passthrough,
        'req_id': reqId,
        'valid_for_current_ip_only': validForCurrentIpOnly == null
            ? null
            : validForCurrentIpOnly ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  ApiTokenRequest copyWith({
    bool apiToken,
    String deleteToken,
    String newToken,
    List<String> newTokenScopes,
    bool validForCurrentIpOnly,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ApiTokenRequest(
        apiToken: apiToken ?? this.apiToken,
        deleteToken: deleteToken ?? this.deleteToken,
        newToken: newToken ?? this.newToken,
        newTokenScopes: newTokenScopes ?? this.newTokenScopes,
        validForCurrentIpOnly:
            validForCurrentIpOnly ?? this.validForCurrentIpOnly,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
