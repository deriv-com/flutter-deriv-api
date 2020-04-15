/// generated automatically from flutter_deriv_api|lib/api/revoke_oauth_app_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'revoke_oauth_app_send.g.dart';

/// JSON conversion for 'revoke_oauth_app_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RevokeOauthAppRequest extends Request {
  /// Initialize RevokeOauthAppRequest
  const RevokeOauthAppRequest({
    this.revokeOauthApp = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory RevokeOauthAppRequest.fromJson(Map<String, dynamic> json) =>
      _$RevokeOauthAppRequestFromJson(json);

  // Properties
  /// The application ID to revoke.
  final int revokeOauthApp;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$RevokeOauthAppRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  RevokeOauthAppRequest copyWith({
    int revokeOauthApp,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      RevokeOauthAppRequest(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
