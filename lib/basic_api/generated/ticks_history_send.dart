/// generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_history_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'ticks_history_send.g.dart';

/// JSON conversion for 'ticks_history_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TicksHistoryRequest extends Request {
  /// Initialize TicksHistoryRequest
  const TicksHistoryRequest({
    this.adjustStartTime,
    this.count,
    this.end,
    this.granularity,
    this.start,
    this.style,
    this.subscribe,
    this.ticksHistory,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory TicksHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$TicksHistoryRequestFromJson(json);

  // Properties
  /// [Optional] 1 - if the market is closed at the end time, or license limit is before end time, adjust interval backwards to compensate.
  final int adjustStartTime;

  /// [Optional] An upper limit on ticks to receive.
  final int count;

  /// Epoch value representing the latest boundary of the returned ticks. If `latest` is specified, this will be the latest available timestamp.
  final String end;

  /// [Optional] Only applicable for style: `candles`. Candle time-dimension width setting. (default: `60`).
  final int granularity;

  /// [Optional] Epoch value representing the earliest boundary of the returned ticks.
  /// - For `"style": "ticks"`: this will default to 1 day ago.
  /// - For `"style": "candles"`: it will default to 1 day ago if count or granularity is undefined.
  final int start;

  /// [Optional] The tick-output style.
  final String style;

  /// [Optional] 1 - to send updates whenever a new tick is received.
  final int subscribe;

  /// Short symbol name (obtained from the `active_symbols` call).
  final String ticksHistory;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TicksHistoryRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TicksHistoryRequest copyWith({
    int adjustStartTime,
    int count,
    String end,
    int granularity,
    int start,
    String style,
    int subscribe,
    String ticksHistory,
    Map<String, dynamic> passthrough,
    int reqId,
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
  List<Object> get props => null;
}
