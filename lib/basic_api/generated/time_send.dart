/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/time_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// TimeRequest class
class TimeRequest extends Request {
  /// Initialize TimeRequest
  const TimeRequest({
    this.time = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'time',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TimeRequest.fromJson(Map<String, dynamic> json) => TimeRequest(
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        time: json['time'] == null ? null : json['time'] == 1,
      );

  /// Must be `true`
  final bool time;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'time': time == null ? null : time ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  TimeRequest copyWith({
    bool time,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TimeRequest(
        time: time ?? this.time,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
