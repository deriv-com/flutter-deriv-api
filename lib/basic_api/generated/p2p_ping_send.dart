/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_ping_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p ping request class.
class P2pPingRequest extends Request {
  /// Initialize P2pPingRequest.
  const P2pPingRequest({
    this.p2pPing = true,
    super.msgType = 'p2p_ping',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pPingRequest.fromJson(Map<String, dynamic> json) => P2pPingRequest(
        p2pPing: json['p2p_ping'] == null ? null : json['p2p_ping'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? p2pPing;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_ping': p2pPing == null
            ? null
            : p2pPing!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pPingRequest copyWith({
    bool? p2pPing,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pPingRequest(
        p2pPing: p2pPing ?? this.p2pPing,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
