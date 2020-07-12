/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ping_send.json

import '../request.dart';

/// PingRequest class
class PingRequest extends Request {
  /// Initialize PingRequest
  const PingRequest({
    this.ping = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'ping',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PingRequest.fromJson(Map<String, dynamic> json) => PingRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        ping: json['ping'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int ping;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'ping': ping,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PingRequest copyWith({
    int ping,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PingRequest(
        ping: ping ?? this.ping,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
