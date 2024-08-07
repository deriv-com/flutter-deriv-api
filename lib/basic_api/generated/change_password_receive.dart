/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/change_password_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Change password receive class.
class ChangePasswordReceive extends Response {
  /// Initialize ChangePasswordReceive.
  const ChangePasswordReceive({
    this.changePassword,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ChangePasswordReceive.fromJson(Map<String, dynamic> json) =>
      ChangePasswordReceive(
        changePassword: json['change_password'] == null
            ? null
            : json['change_password'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// If set to `true`, password updated.
  final bool? changePassword;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'change_password': changePassword == null
            ? null
            : changePassword!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ChangePasswordReceive copyWith({
    bool? changePassword,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ChangePasswordReceive(
        changePassword: changePassword ?? this.changePassword,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
