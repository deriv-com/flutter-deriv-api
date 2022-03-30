/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/time_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Time request class.
class TimeRequest extends Request {
  /// Initialize TimeRequest.
  const TimeRequest({
    this.time = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'time',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TimeRequest.fromJson(Map<String, dynamic> json) => TimeRequest(
        time: json['time'] == null ? null : json['time'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? time;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'time': time == null
            ? null
            : time!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TimeRequest copyWith({
    bool? time,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TimeRequest(
        time: time ?? this.time,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
