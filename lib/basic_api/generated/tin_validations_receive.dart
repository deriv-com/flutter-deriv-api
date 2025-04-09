/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/tin_validations_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Tin validations receive class.
class TinValidationsReceive extends Response {
  /// Initialize TinValidationsReceive.
  const TinValidationsReceive({
    this.tinValidations,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TinValidationsReceive.fromJson(Map<String, dynamic> json) =>
      TinValidationsReceive(
        tinValidations: json['tin_validations'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Validations for Tax Identification Numbers (TIN)
  final Map<String, dynamic>? tinValidations;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'tin_validations': tinValidations,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TinValidationsReceive copyWith({
    Map<String, dynamic>? tinValidations,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TinValidationsReceive(
        tinValidations: tinValidations ?? this.tinValidations,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
