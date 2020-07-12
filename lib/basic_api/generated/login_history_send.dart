/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/login_history_send.json

import '../request.dart';

/// LoginHistoryRequest class
class LoginHistoryRequest extends Request {
  /// Initialize LoginHistoryRequest
  const LoginHistoryRequest({
    this.limit,
    this.loginHistory = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'login_history',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LoginHistoryRequest.fromJson(Map<String, dynamic> json) =>
      LoginHistoryRequest(
        // ignore: avoid_as
        limit: json['limit'] as int,
        // ignore: avoid_as
        loginHistory: json['login_history'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// [Optional] Apply limit to count of login history records.
  final int limit;

  /// Must be `1`
  final int loginHistory;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'limit': limit,
        'login_history': loginHistory,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LoginHistoryRequest copyWith({
    int limit,
    int loginHistory,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      LoginHistoryRequest(
        limit: limit ?? this.limit,
        loginHistory: loginHistory ?? this.loginHistory,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
