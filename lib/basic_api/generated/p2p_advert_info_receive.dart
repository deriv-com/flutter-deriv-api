/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_receive.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advert info response class.
class P2pAdvertInfoResponse extends Response {
  /// Initialize P2pAdvertInfoResponse.
  const P2pAdvertInfoResponse({
    this.p2pAdvertInfo,
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
  factory P2pAdvertInfoResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: json['p2p_advert_info'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// P2P advert information.
  final Map<String, dynamic>? p2pAdvertInfo;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advert_info': p2pAdvertInfo,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertInfoResponse copyWith({
    Map<String, dynamic>? p2pAdvertInfo,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
