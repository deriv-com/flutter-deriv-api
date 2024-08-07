/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Topup virtual receive class.
class TopupVirtualReceive extends Response {
  /// Initialize TopupVirtualReceive.
  const TopupVirtualReceive({
    this.topupVirtual,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TopupVirtualReceive.fromJson(Map<String, dynamic> json) =>
      TopupVirtualReceive(
        topupVirtual: json['topup_virtual'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information regarding a successful top up for a virtual money account
  final Map<String, dynamic>? topupVirtual;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'topup_virtual': topupVirtual,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TopupVirtualReceive copyWith({
    Map<String, dynamic>? topupVirtual,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TopupVirtualReceive(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
