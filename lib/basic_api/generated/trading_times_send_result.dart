/// Trading times send model class
abstract class TradingTimesSendModel {
  /// Initializes
  TradingTimesSendModel({
    @required this.tradingTimes,
  });

  /// Date to receive market opening times for. (`yyyy-mm-dd` format. `today` can also be specified).
  final String tradingTimes;
}

/// Trading times send class
class TradingTimesSend extends TradingTimesSendModel {
  /// Initializes
  TradingTimesSend({
    @required String tradingTimes,
  }) : super(
          tradingTimes: tradingTimes,
        );

  /// Creates an instance from JSON
  factory TradingTimesSend.fromJson(Map<String, dynamic> json) =>
      TradingTimesSend(
        tradingTimes: json['trading_times'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['trading_times'] = tradingTimes;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradingTimesSend copyWith({
    String tradingTimes,
  }) =>
      TradingTimesSend(
        tradingTimes: tradingTimes ?? this.tradingTimes,
      );
}
