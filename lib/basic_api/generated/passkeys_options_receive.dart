/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_options_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Passkeys options receive class.
class PasskeysOptionsReceive extends Response {
  /// Initialize PasskeysOptionsReceive.
  const PasskeysOptionsReceive({
    this.passkeysOptions,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysOptionsReceive.fromJson(Map<String, dynamic> json) =>
      PasskeysOptionsReceive(
        passkeysOptions: json['passkeys_options'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Wrapper of the response.
  final Map<String, dynamic>? passkeysOptions;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passkeys_options': passkeysOptions,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysOptionsReceive copyWith({
    Map<String, dynamic>? passkeysOptions,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PasskeysOptionsReceive(
        passkeysOptions: passkeysOptions ?? this.passkeysOptions,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
