/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_history_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Ticks history request class
class TicksHistoryRequest extends Request {
  /// Initialize TicksHistoryRequest
  const TicksHistoryRequest({
    this.adjustStartTime,
    this.count,
    @required this.end,
    this.granularity,
    this.start,
    this.style,
    this.subscribe,
    @required this.ticksHistory,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'ticks_history',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TicksHistoryRequest.fromJson(Map<String, dynamic> json) =>
      TicksHistoryRequest(
        adjustStartTime: json['adjust_start_time'] as int?,
        count: json['count'] as int?,
        end: json['end'] as String?,
        granularity: json['granularity'] as int?,
        start: json['start'] as int?,
        style: json['style'] as String?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        ticksHistory: json['ticks_history'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] 1 - if the market is closed at the end time, or license limit is before end time, adjust interval backwards to compensate.
  final int? adjustStartTime;

  /// [Optional] An upper limit on ticks to receive.
  final int? count;

  /// Epoch value representing the latest boundary of the returned ticks. If `latest` is specified, this will be the latest available timestamp.
  final String? end;

  /// [Optional] Only applicable for style: `candles`. Candle time-dimension width setting. (default: `60`).
  final int? granularity;

  /// [Optional] Epoch value representing the earliest boundary of the returned ticks.
  /// - For `"style": "ticks"`: this will default to 1 day ago.
  /// - For `"style": "candles"`: it will default to 1 day ago if count or granularity is undefined.
  final int? start;

  /// [Optional] The tick-output style.
  final String? style;

  /// [Optional] `true` - to send updates whenever a new tick is received.
  final bool? subscribe;

  /// Short symbol name (obtained from the `active_symbols` call).
  final String? ticksHistory;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'adjust_start_time': adjustStartTime,
        'count': count,
        'end': end,
        'granularity': granularity,
        'start': start,
        'style': style,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'ticks_history': ticksHistory,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksHistoryRequest copyWith({
    int? adjustStartTime,
    int? count,
    String? end,
    int? granularity,
    int? start,
    String? style,
    bool? subscribe,
    String? ticksHistory,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TicksHistoryRequest(
        adjustStartTime: adjustStartTime ?? this.adjustStartTime,
        count: count ?? this.count,
        end: end ?? this.end,
        granularity: granularity ?? this.granularity,
        start: start ?? this.start,
        style: style ?? this.style,
        subscribe: subscribe ?? this.subscribe,
        ticksHistory: ticksHistory ?? this.ticksHistory,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
