/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_relations_receive.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advertiser relations response class.
class P2pAdvertiserRelationsResponse extends Response {
  /// Initialize P2pAdvertiserRelationsResponse.
  const P2pAdvertiserRelationsResponse({
    this.p2pAdvertiserRelations,
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
  factory P2pAdvertiserRelationsResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserRelationsResponse(
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
  P2pAdvertiserRelationsResponse copyWith({
    Map<String, dynamic>? p2pAdvertiserRelations,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertiserRelationsResponse(
        p2pAdvertiserRelations:
            p2pAdvertiserRelations ?? this.p2pAdvertiserRelations,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
