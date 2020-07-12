/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_self_exclusion_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Get self exclusion response class
class GetSelfExclusionResponse extends Response {
  /// Initialize GetSelfExclusionResponse
  const GetSelfExclusionResponse({
    this.getSelfExclusion,
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
  factory GetSelfExclusionResponse.fromJson(Map<String, dynamic> json) =>
      GetSelfExclusionResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        getSelfExclusion: json['get_self_exclusion'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// List of values set for self exclusion.
  final Map<String, dynamic> getSelfExclusion;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'get_self_exclusion': getSelfExclusion,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSelfExclusionResponse copyWith({
    Map<String, dynamic> getSelfExclusion,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetSelfExclusionResponse(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
