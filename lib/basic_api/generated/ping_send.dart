/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ping_send.json.

import '../request.dart';

/// Ping request class.
class PingRequest extends Request {
  /// Initialize PingRequest.
  const PingRequest({
    this.ping = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'ping',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory PingRequest.fromJson(Map<String, dynamic> json) => PingRequest(
        ping: json['ping'] == null ? null : json['ping'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? ping;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'ping': ping == null
            ? null
            : ping!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PingRequest copyWith({
    bool? ping,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PingRequest(
        ping: ping ?? this.ping,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
