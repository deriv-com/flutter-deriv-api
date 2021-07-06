/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Ticks send class.
class TicksSend extends Request {
  /// Initialize TicksSend.
  const TicksSend({
    this.subscribe,
    this.ticks,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'ticks',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TicksSend.fromJson(Map<String, dynamic> json) => TicksSend(
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        ticks: json['ticks'] as dynamic,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] If set to `true`, will send updates whenever a new tick is received.
  final bool? subscribe;

  /// The short symbol name or array of symbols (obtained from `active_symbols` call).
  final dynamic ticks;

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
  TicksSend copyWith({
    bool? subscribe,
    dynamic ticks,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TicksSend(
        subscribe: subscribe ?? this.subscribe,
        ticks: ticks ?? this.ticks,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
