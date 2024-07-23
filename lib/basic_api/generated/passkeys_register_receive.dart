/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_register_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Passkeys register receive class.
class PasskeysRegisterReceive extends Response {
  /// Initialize PasskeysRegisterReceive.
  const PasskeysRegisterReceive({
    this.passkeysRegister,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegisterReceive.fromJson(Map<String, dynamic> json) =>
      PasskeysRegisterReceive(
        passkeysRegister: json['passkeys_register'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Wrapper of the response.
  final Map<String, dynamic>? passkeysRegister;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passkeys_register': passkeysRegister,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysRegisterReceive copyWith({
    Map<String, dynamic>? passkeysRegister,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PasskeysRegisterReceive(
        passkeysRegister: passkeysRegister ?? this.passkeysRegister,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
