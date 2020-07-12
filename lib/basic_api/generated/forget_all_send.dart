/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_all_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// Forget all request class
class ForgetAllRequest extends Request {
  /// Initialize ForgetAllRequest
  const ForgetAllRequest({
    this.forgetAll,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'forget_all',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ForgetAllRequest.fromJson(Map<String, dynamic> json) =>
      ForgetAllRequest(
        forgetAll: json['forget_all'] as dynamic,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Cancel all streams by type. The value can be either a single type e.g. `"ticks"`, or an array of multiple types e.g. `["candles", "ticks"]`.
  final dynamic forgetAll;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'forget_all': forgetAll,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetAllRequest copyWith({
    dynamic forgetAll,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ForgetAllRequest(
        forgetAll: forgetAll ?? this.forgetAll,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
