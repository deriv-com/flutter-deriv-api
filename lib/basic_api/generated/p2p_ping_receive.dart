/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_ping_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p ping receive class.
class P2pPingReceive extends Response {
  /// Initialize P2pPingReceive.
  const P2pPingReceive({
    this.p2pPing,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pPingReceive.fromJson(Map<String, dynamic> json) => P2pPingReceive(
        p2pPing: json['p2p_ping'] as String?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Will return 'pong'
  final String? p2pPing;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_ping': p2pPing,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pPingReceive copyWith({
    String? p2pPing,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pPingReceive(
        p2pPing: p2pPing ?? this.p2pPing,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
