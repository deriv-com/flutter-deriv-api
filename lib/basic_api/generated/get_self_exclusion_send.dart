/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_self_exclusion_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Get self exclusion request class
class GetSelfExclusionRequest extends Request {
  /// Initialize GetSelfExclusionRequest
  const GetSelfExclusionRequest({
    this.getSelfExclusion = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_self_exclusion',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetSelfExclusionRequest.fromJson(Map<String, dynamic> json) =>
      GetSelfExclusionRequest(
        getSelfExclusion: json['get_self_exclusion'] == null
            ? null
            : json['get_self_exclusion'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool getSelfExclusion;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_self_exclusion':
            getSelfExclusion == null ? null : getSelfExclusion ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSelfExclusionRequest copyWith({
    bool getSelfExclusion,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetSelfExclusionRequest(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
