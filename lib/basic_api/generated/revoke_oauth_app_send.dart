/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/revoke_oauth_app_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Revoke oauth app send class.
class RevokeOauthAppSend extends Request {
  /// Initialize RevokeOauthAppSend.
  const RevokeOauthAppSend({
    required this.revokeOauthApp,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'revoke_oauth_app',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory RevokeOauthAppSend.fromJson(Map<String, dynamic> json) =>
      RevokeOauthAppSend(
        revokeOauthApp: json['revoke_oauth_app'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The application ID to revoke.
  final int? revokeOauthApp;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'revoke_oauth_app': revokeOauthApp,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RevokeOauthAppSend copyWith({
    int? revokeOauthApp,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      RevokeOauthAppSend(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
