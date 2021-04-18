/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/logout_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Logout request class
class LogoutRequest extends Request {
  /// Initialize LogoutRequest
  const LogoutRequest({
    this.logout = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'logout',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LogoutRequest.fromJson(Map<String, dynamic> json) => LogoutRequest(
        logout: json['logout'] == null ? null : json['logout'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? logout;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
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
    bool? logout,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LogoutRequest(
        logout: logout ?? this.logout,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
