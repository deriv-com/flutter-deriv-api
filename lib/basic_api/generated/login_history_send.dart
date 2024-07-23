/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/login_history_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Login history request class.
class LoginHistoryRequest extends Request {
  /// Initialize LoginHistoryRequest.
  const LoginHistoryRequest({
    this.limit,
    this.loginHistory = true,
    this.loginid,
    super.msgType = 'login_history',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory LoginHistoryRequest.fromJson(Map<String, dynamic> json) =>
      LoginHistoryRequest(
        limit: json['limit'] as int?,
        loginHistory:
            json['login_history'] == null ? null : json['login_history'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Apply limit to count of login history records.
  final int? limit;

  /// Must be `true`
  final bool? loginHistory;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'limit': limit,
        'login_history': loginHistory == null
            ? null
            : loginHistory!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LoginHistoryRequest copyWith({
    int? limit,
    bool? loginHistory,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LoginHistoryRequest(
        limit: limit ?? this.limit,
        loginHistory: loginHistory ?? this.loginHistory,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
