/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_list_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// P2p advert list response class
class P2pAdvertListResponse extends Response {
  /// Initialize P2pAdvertListResponse
  const P2pAdvertListResponse({
    this.p2pAdvertList,
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
  factory P2pAdvertListResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertListResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        p2pAdvertList: json['p2p_advert_list'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// P2P adverts list.
  final Map<String, dynamic> p2pAdvertList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_advert_list': p2pAdvertList,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertListResponse copyWith({
    Map<String, dynamic> p2pAdvertList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertListResponse(
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
