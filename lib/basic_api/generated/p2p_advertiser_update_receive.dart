/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_update_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advertiser update receive class.
class P2pAdvertiserUpdateReceive extends Response {
  /// Initialize P2pAdvertiserUpdateReceive.
  const P2pAdvertiserUpdateReceive({
    this.p2pAdvertiserUpdate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserUpdateReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdateReceive(
        p2pAdvertiserUpdate:
            json['p2p_advertiser_update'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// P2P advertiser information.
  final Map<String, dynamic>? p2pAdvertiserUpdate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advertiser_update': p2pAdvertiserUpdate,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserUpdateReceive copyWith({
    Map<String, dynamic>? p2pAdvertiserUpdate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertiserUpdateReceive(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
