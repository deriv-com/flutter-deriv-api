/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_login_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Passkeys login receive class.
class PasskeysLoginReceive extends Response {
  /// Initialize PasskeysLoginReceive.
  const PasskeysLoginReceive({
    this.passkeysLogin,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysLoginReceive.fromJson(Map<String, dynamic> json) =>
      PasskeysLoginReceive(
        passkeysLogin: json['passkeys_login'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Wrapper of the response.
  final Map<String, dynamic>? passkeysLogin;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passkeys_login': passkeysLogin,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysLoginReceive copyWith({
    Map<String, dynamic>? passkeysLogin,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PasskeysLoginReceive(
        passkeysLogin: passkeysLogin ?? this.passkeysLogin,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
