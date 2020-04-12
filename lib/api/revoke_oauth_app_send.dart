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
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
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
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      RevokeOauthAppRequest(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
