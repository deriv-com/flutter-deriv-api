/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_update_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advert update receive class.
class P2pAdvertUpdateReceive extends Response {
  /// Initialize P2pAdvertUpdateReceive.
  const P2pAdvertUpdateReceive({
    this.p2pAdvertUpdate,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertUpdateReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdateReceive(
        p2pAdvertUpdate: json['p2p_advert_update'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// P2P updated advert information.
  final Map<String, dynamic>? p2pAdvertUpdate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advert_update': p2pAdvertUpdate,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertUpdateReceive copyWith({
    Map<String, dynamic>? p2pAdvertUpdate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertUpdateReceive(
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
