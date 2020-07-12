/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/logout_send.json

import '../request.dart';

/// LogoutRequest class
class LogoutRequest extends Request {
  /// Initialize LogoutRequest
  const LogoutRequest({
    this.logout = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'logout',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LogoutRequest.fromJson(Map<String, dynamic> json) => LogoutRequest(
        // ignore: avoid_as
        logout: json['logout'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int logout;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'logout': logout,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LogoutRequest copyWith({
    int logout,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      LogoutRequest(
        logout: logout ?? this.logout,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
