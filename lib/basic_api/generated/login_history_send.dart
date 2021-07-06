/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/login_history_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Login history send class.
class LoginHistorySend extends Request {
  /// Initialize LoginHistorySend.
  const LoginHistorySend({
    this.limit,
    this.loginHistory = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'login_history',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory LoginHistorySend.fromJson(Map<String, dynamic> json) =>
      LoginHistorySend(
        limit: json['limit'] as int?,
        loginHistory:
            json['login_history'] == null ? null : json['login_history'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Apply limit to count of login history records.
  final int? limit;

  /// Must be `true`
  final bool? loginHistory;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'limit': limit,
        'login_history': loginHistory == null
            ? null
            : loginHistory!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LoginHistorySend copyWith({
    int? limit,
    bool? loginHistory,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LoginHistorySend(
        limit: limit ?? this.limit,
        loginHistory: loginHistory ?? this.loginHistory,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
