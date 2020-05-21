/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/revoke_oauth_app_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'revoke_oauth_app_send.g.dart';

/// JSON conversion for 'revoke_oauth_app_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class RevokeOauthAppRequest extends Request {
  /// Initialize RevokeOauthAppRequest
  const RevokeOauthAppRequest({
    this.revokeOauthApp = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'revoke_oauth_app',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory RevokeOauthAppRequest.fromJson(Map<String, dynamic> json) =>
      _$RevokeOauthAppRequestFromJson(json);

  /// The application ID to revoke.
  final int revokeOauthApp;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$RevokeOauthAppRequestToJson(this);

  /// Creates a copy of instance with given parameters
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
