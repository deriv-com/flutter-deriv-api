/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Reality check receive class.
class RealityCheckReceive extends Response {
  /// Initialize RealityCheckReceive.
  const RealityCheckReceive({
    this.realityCheck,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory RealityCheckReceive.fromJson(Map<String, dynamic> json) =>
      RealityCheckReceive(
        realityCheck: json['reality_check'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Reality check summary of trades.
  final Map<String, dynamic>? realityCheck;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'reality_check': realityCheck,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RealityCheckReceive copyWith({
    Map<String, dynamic>? realityCheck,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      RealityCheckReceive(
        realityCheck: realityCheck ?? this.realityCheck,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
