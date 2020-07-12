/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_limits_send.json

import '../request.dart';

/// GetLimitsRequest class
class GetLimitsRequest extends Request {
  /// Initialize GetLimitsRequest
  const GetLimitsRequest({
    this.getLimits = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_limits',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetLimitsRequest.fromJson(Map<String, dynamic> json) =>
      GetLimitsRequest(
        // ignore: avoid_as
        getLimits: json['get_limits'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int getLimits;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_limits': getLimits,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetLimitsRequest copyWith({
    int getLimits,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetLimitsRequest(
        getLimits: getLimits ?? this.getLimits,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
