/// Ticks history send model class
abstract class TicksHistorySendModel {
  /// Initializes
  TicksHistorySendModel({
    @required this.ticksHistory,
    this.adjustStartTime,
    this.count,
    @required this.end,
    this.granularity,
    this.start,
    this.style,
    this.subscribe,
  });

  /// Short symbol name (obtained from the `active_symbols` call).
  final String ticksHistory;

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
  final StyleEnum style;

  /// [Optional] 1 - to send updates whenever a new tick is received.
  final int subscribe;
}

/// Ticks history send class
class TicksHistorySend extends TicksHistorySendModel {
  /// Initializes
  TicksHistorySend({
    @required String ticksHistory,
    int adjustStartTime,
    int count,
    @required String end,
    int granularity,
    int start,
    String style,
    int subscribe,
  }) : super(
          ticksHistory: ticksHistory,
          adjustStartTime: adjustStartTime,
          count: count,
          end: end,
          granularity: granularity,
          start: start,
          style: style,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory TicksHistorySend.fromJson(Map<String, dynamic> json) =>
      TicksHistorySend(
        ticksHistory: json['ticks_history'],
        adjustStartTime: json['adjust_start_time'],
        count: json['count'],
        end: json['end'],
        granularity: json['granularity'],
        start: json['start'],
        style: json['style'] == null
            ? null
            : styleEnumMapper.entries
                .firstWhere((entry) => entry.value == json['style'],
                    orElse: () => null)
                ?.key,
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['ticks_history'] = ticksHistory;
    result['adjust_start_time'] = adjustStartTime;
    result['count'] = count;
    result['end'] = end;
    result['granularity'] = granularity;
    result['start'] = start;
    result['style'] = styleEnumMapper[style];
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TicksHistorySend copyWith({
    String ticksHistory,
    int adjustStartTime,
    int count,
    String end,
    int granularity,
    int start,
    String style,
    int subscribe,
  }) =>
      TicksHistorySend(
        ticksHistory: ticksHistory ?? this.ticksHistory,
        adjustStartTime: adjustStartTime ?? this.adjustStartTime,
        count: count ?? this.count,
        end: end ?? this.end,
        granularity: granularity ?? this.granularity,
        start: start ?? this.start,
        style: style ?? this.style,
        subscribe: subscribe ?? this.subscribe,
      );
  // Creating Enum Mappers

  static final Map<StyleEnum, String> styleEnumMapper = {
    StyleEnum.candles: 'candles',
    StyleEnum.ticks: 'ticks',
  };
}

// Creating Enums

enum StyleEnum {
  candles,
  ticks,
}
