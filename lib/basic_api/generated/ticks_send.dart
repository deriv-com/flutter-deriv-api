/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_send.json

import '../request.dart';

/// Ticks request class
class TicksRequest extends Request {
  /// Initialize TicksRequest
  const TicksRequest({
    this.subscribe,
    this.ticks,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'ticks',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TicksRequest.fromJson(Map<String, dynamic> json) => TicksRequest(
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        ticks: json['ticks'] as dynamic?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] If set to `true`, will send updates whenever a new tick is received.
  final bool? subscribe;

  /// The short symbol name or array of symbols (obtained from `active_symbols` call).
  final dynamic? ticks;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'ticks': ticks,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksRequest copyWith({
    bool? subscribe,
    dynamic? ticks,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TicksRequest(
        subscribe: subscribe ?? this.subscribe,
        ticks: ticks ?? this.ticks,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[ticks!];
}
