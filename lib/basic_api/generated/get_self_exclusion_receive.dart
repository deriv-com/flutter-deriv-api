/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_self_exclusion_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Get self exclusion receive class.
class GetSelfExclusionReceive extends Response {
  /// Initialize GetSelfExclusionReceive.
  const GetSelfExclusionReceive({
    this.getSelfExclusion,
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
  factory GetSelfExclusionReceive.fromJson(Map<String, dynamic> json) =>
      GetSelfExclusionReceive(
        getSelfExclusion: json['get_self_exclusion'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of values set for self exclusion.
  final Map<String, dynamic>? getSelfExclusion;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_self_exclusion': getSelfExclusion,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSelfExclusionReceive copyWith({
    Map<String, dynamic>? getSelfExclusion,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      GetSelfExclusionReceive(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
