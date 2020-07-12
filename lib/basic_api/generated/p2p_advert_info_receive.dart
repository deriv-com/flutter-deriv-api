/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_receive.json

import '../response.dart';

/// P2pAdvertInfoResponse class
class P2pAdvertInfoResponse extends Response {
  /// Initialize P2pAdvertInfoResponse
  const P2pAdvertInfoResponse({
    this.p2pAdvertInfo,
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
  factory P2pAdvertInfoResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertInfoResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        p2pAdvertInfo: json['p2p_advert_info'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// P2P advert information.
  final Map<String, dynamic> p2pAdvertInfo;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_advert_info': p2pAdvertInfo,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertInfoResponse copyWith({
    Map<String, dynamic> p2pAdvertInfo,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
