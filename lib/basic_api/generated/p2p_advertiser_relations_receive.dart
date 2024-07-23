/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_relations_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advertiser relations receive class.
class P2pAdvertiserRelationsReceive extends Response {
  /// Initialize P2pAdvertiserRelationsReceive.
  const P2pAdvertiserRelationsReceive({
    this.p2pAdvertiserRelations,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserRelationsReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserRelationsReceive(
        p2pAdvertiserRelations:
            json['p2p_advertiser_relations'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// P2P advertiser relations information.
  final Map<String, dynamic>? p2pAdvertiserRelations;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advertiser_relations': p2pAdvertiserRelations,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserRelationsReceive copyWith({
    Map<String, dynamic>? p2pAdvertiserRelations,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertiserRelationsReceive(
        p2pAdvertiserRelations:
            p2pAdvertiserRelations ?? this.p2pAdvertiserRelations,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
