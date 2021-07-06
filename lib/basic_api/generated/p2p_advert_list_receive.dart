/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advert list receive class.
class P2pAdvertListReceive extends Response {
  /// Initialize P2pAdvertListReceive.
  const P2pAdvertListReceive({
    this.p2pAdvertList,
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
  factory P2pAdvertListReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertListReceive(
        p2pAdvertList: json['p2p_advert_list'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// P2P adverts list.
  final Map<String, dynamic>? p2pAdvertList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advert_list': p2pAdvertList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertListReceive copyWith({
    Map<String, dynamic>? p2pAdvertList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertListReceive(
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
