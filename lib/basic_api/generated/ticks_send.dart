/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_send.json

import '../request.dart';

/// TicksRequest class
class TicksRequest extends Request {
  /// Initialize TicksRequest
  const TicksRequest({
    this.subscribe,
    this.ticks,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'ticks',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TicksRequest.fromJson(Map<String, dynamic> json) => TicksRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
        // ignore: avoid_as
        ticks: json['ticks'] as dynamic,
      );

  /// [Optional] If set to 1, will send updates whenever a new tick is received.
  final int subscribe;

  /// The short symbol name or array of symbols (obtained from `active_symbols` call).
  final dynamic ticks;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'subscribe': subscribe,
        'ticks': ticks,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksRequest copyWith({
    int subscribe,
    dynamic ticks,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TicksRequest(
        subscribe: subscribe ?? this.subscribe,
        ticks: ticks ?? this.ticks,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[ticks];
}
