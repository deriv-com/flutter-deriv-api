/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/revoke_oauth_app_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Revoke oauth app request class.
class RevokeOauthAppRequest extends Request {
  /// Initialize RevokeOauthAppRequest.
  const RevokeOauthAppRequest({
    this.loginid,
    required this.revokeOauthApp,
    super.msgType = 'revoke_oauth_app',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory RevokeOauthAppRequest.fromJson(Map<String, dynamic> json) =>
      RevokeOauthAppRequest(
        loginid: json['loginid'] as String?,
        revokeOauthApp: json['revoke_oauth_app'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// The application ID to revoke.
  final int? revokeOauthApp;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'revoke_oauth_app': revokeOauthApp,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RevokeOauthAppRequest copyWith({
    String? loginid,
    int? revokeOauthApp,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      RevokeOauthAppRequest(
        loginid: loginid ?? this.loginid,
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
