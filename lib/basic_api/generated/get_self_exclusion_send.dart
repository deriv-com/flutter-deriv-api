/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_self_exclusion_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Get self exclusion send class
class GetSelfExclusionSend extends Request {
  /// Initialize GetSelfExclusionSend
  const GetSelfExclusionSend({
    this.getSelfExclusion = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_self_exclusion',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetSelfExclusionSend.fromJson(Map<String, dynamic> json) =>
      GetSelfExclusionSend(
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
        'get_self_exclusion': getSelfExclusion == null
            ? null
            : getSelfExclusion
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSelfExclusionSend copyWith({
    bool getSelfExclusion,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetSelfExclusionSend(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
