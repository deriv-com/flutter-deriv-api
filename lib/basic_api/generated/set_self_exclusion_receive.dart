/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_self_exclusion_receive.json.

import '../response.dart';

/// Set self exclusion response class.
class SetSelfExclusionResponse extends Response {
  /// Initialize SetSelfExclusionResponse.
  const SetSelfExclusionResponse({
    this.setSelfExclusion,
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
  factory SetSelfExclusionResponse.fromJson(Map<String, dynamic> json) =>
      SetSelfExclusionResponse(
        setSelfExclusion: json['set_self_exclusion'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `1` on success
  final int? setSelfExclusion;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'set_self_exclusion': setSelfExclusion,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetSelfExclusionResponse copyWith({
    int? setSelfExclusion,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      SetSelfExclusionResponse(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
