/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/logout_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Logout receive class.
class LogoutReceive extends Response {
  /// Initialize LogoutReceive.
  const LogoutReceive({
    this.logout,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory LogoutReceive.fromJson(Map<String, dynamic> json) => LogoutReceive(
        logout: json['logout'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The result of logout request which is 1
  final int? logout;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'logout': logout,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LogoutReceive copyWith({
    int? logout,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      LogoutReceive(
        logout: logout ?? this.logout,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
