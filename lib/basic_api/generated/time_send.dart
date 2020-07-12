/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/time_send.json

import '../request.dart';

/// TimeRequest class
class TimeRequest extends Request {
  /// Initialize TimeRequest
  const TimeRequest({
    this.time = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'time',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TimeRequest.fromJson(Map<String, dynamic> json) => TimeRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        time: json['time'] as int,
      );

  /// Must be `1`
  final int time;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'time': time,
      };

  /// Creates a copy of instance with given parameters
  @override
  TimeRequest copyWith({
    int time,
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
