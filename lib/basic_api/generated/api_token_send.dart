/// generated automatically from flutter_deriv_api|lib/basic_api/generated/api_token_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'api_token_send.g.dart';

/// JSON conversion for 'api_token_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ApiTokenRequest extends Request {
  /// Initialize ApiTokenRequest
  const ApiTokenRequest({
    this.apiToken = 1,
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
      _$ApiTokenRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int apiToken;

  /// [Optional] The token to remove.
  final String deleteToken;

  /// [Optional] The name of the created token.
  final String newToken;

  /// [Optional] List of permission scopes to provide with the token.
  final List<String> newTokenScopes;

  /// [Optional] If you set this parameter during token creation, then the token created will only work for the IP address that was used to create the token
  final int validForCurrentIpOnly;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ApiTokenRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ApiTokenRequest copyWith({
    int apiToken,
    String deleteToken,
    String newToken,
    List<String> newTokenScopes,
    int validForCurrentIpOnly,
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
