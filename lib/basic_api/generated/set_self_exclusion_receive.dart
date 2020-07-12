/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_self_exclusion_receive.json

import '../response.dart';

/// SetSelfExclusionResponse class
class SetSelfExclusionResponse extends Response {
  /// Initialize SetSelfExclusionResponse
  const SetSelfExclusionResponse({
    this.setSelfExclusion,
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
  factory SetSelfExclusionResponse.fromJson(Map<String, dynamic> json) =>
      SetSelfExclusionResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        setSelfExclusion: json['set_self_exclusion'] as int,
      );

  /// `1` on success
  final int setSelfExclusion;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'set_self_exclusion': setSelfExclusion,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetSelfExclusionResponse copyWith({
    int setSelfExclusion,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SetSelfExclusionResponse(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
