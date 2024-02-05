/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/logout_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Logout request class.
class LogoutRequest extends Request {
  /// Initialize LogoutRequest.
  const LogoutRequest({
    this.loginid,
    this.logout = true,
    super.msgType = 'logout',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory LogoutRequest.fromJson(Map<String, dynamic> json) => LogoutRequest(
        loginid: json['loginid'] as String?,
        logout: json['logout'] == null ? null : json['logout'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? logout;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'logout': logout == null
            ? null
            : logout!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LogoutRequest copyWith({
    String? loginid,
    bool? logout,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LogoutRequest(
        loginid: loginid ?? this.loginid,
        logout: logout ?? this.logout,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
