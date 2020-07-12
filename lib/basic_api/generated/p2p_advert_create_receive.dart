/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_create_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// P2pAdvertCreateResponse class
class P2pAdvertCreateResponse extends Response {
  /// Initialize P2pAdvertCreateResponse
  const P2pAdvertCreateResponse({
    this.p2pAdvertCreate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertCreateResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreateResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        p2pAdvertCreate: json['p2p_advert_create'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// The information of the created P2P advert.
  final Map<String, dynamic> p2pAdvertCreate;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_advert_create': p2pAdvertCreate,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertCreateResponse copyWith({
    Map<String, dynamic> p2pAdvertCreate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
