/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_self_exclusion_send.json

import '../request.dart';

/// GetSelfExclusionRequest class
class GetSelfExclusionRequest extends Request {
  /// Initialize GetSelfExclusionRequest
  const GetSelfExclusionRequest({
    this.getSelfExclusion = 1,
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
        // ignore: avoid_as
        getSelfExclusion: json['get_self_exclusion'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int getSelfExclusion;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_self_exclusion': getSelfExclusion,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSelfExclusionRequest copyWith({
    int getSelfExclusion,
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
