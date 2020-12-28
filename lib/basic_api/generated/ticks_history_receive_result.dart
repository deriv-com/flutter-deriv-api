/// Ticks history receive model class
abstract class TicksHistoryReceiveModel {
  /// Initializes
  TicksHistoryReceiveModel({
    @required this.candles,
    @required this.history,
    @required this.pipSize,
    @required this.subscription,
  });

  /// Array of OHLC (open/high/low/close) price values for the given time (only for style=`candles`)
  final List<Candle> candles;

  /// Historic tick data for a given symbol. Note: this will always return the latest possible set of ticks with accordance to the parameters specified.
  final History history;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final double pipSize;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Ticks history receive class
class TicksHistoryReceive extends TicksHistoryReceiveModel {
  /// Initializes
  TicksHistoryReceive({
    @required List<Candle> candles,
    @required History history,
    @required double pipSize,
    @required Subscription subscription,
  }) : super(
          candles: candles,
          history: history,
          pipSize: pipSize,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory TicksHistoryReceive.fromJson(Map<String, dynamic> json) =>
      TicksHistoryReceive(
        candles: json['candles'] == null
            ? null
            : json['candles']
                .map<Candle>((dynamic item) => Candle.fromJson(item))
                .toList(),
        history:
            json['history'] == null ? null : History.fromJson(json['history']),
        pipSize: getDouble(json['pip_size']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (candles != null) {
      result['candles'] = candles.map((item) => item.toJson()).toList();
    }
    if (history != null) {
      result['history'] = history.toJson();
    }
    result['pip_size'] = pipSize;
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TicksHistoryReceive copyWith({
    List<Candle> candles,
    History history,
    double pipSize,
    Subscription subscription,
  }) =>
      TicksHistoryReceive(
        candles: candles ?? this.candles,
        history: history ?? this.history,
        pipSize: pipSize ?? this.pipSize,
        subscription: subscription ?? this.subscription,
      );
}
/// Candle model class
abstract class CandleModel {
  /// Initializes
  CandleModel({
    @required this.close,
    @required this.epoch,
    @required this.high,
    @required this.low,
    @required this.open,
  });

  /// It is the close price value for the given time
  final double close;

  /// It is an epoch value
  final int epoch;

  /// It is the high price value for the given time
  final double high;

  /// It is the low price value for the given time
  final double low;

  /// It is the open price value for the given time
  final double open;
}

/// Candle class
class Candle extends CandleModel {
  /// Initializes
  Candle({
    @required double close,
    @required int epoch,
    @required double high,
    @required double low,
    @required double open,
  }) : super(
          close: close,
          epoch: epoch,
          high: high,
          low: low,
          open: open,
        );

  /// Creates an instance from JSON
  factory Candle.fromJson(Map<String, dynamic> json) => Candle(
        close: getDouble(json['close']),
        epoch: json['epoch'],
        high: getDouble(json['high']),
        low: getDouble(json['low']),
        open: getDouble(json['open']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['close'] = close;
    result['epoch'] = epoch;
    result['high'] = high;
    result['low'] = low;
    result['open'] = open;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Candle copyWith({
    double close,
    int epoch,
    double high,
    double low,
    double open,
  }) =>
      Candle(
        close: close ?? this.close,
        epoch: epoch ?? this.epoch,
        high: high ?? this.high,
        low: low ?? this.low,
        open: open ?? this.open,
      );
}
/// History model class
abstract class HistoryModel {
  /// Initializes
  HistoryModel({
    @required this.prices,
    @required this.times,
  });

  /// An array containing list of tick values for the corresponding epoch values in `times` array.
  final List<double> prices;

  /// An array containing list of epoch values for the corresponding tick values in `prices` array.
  final List<int> times;
}

/// History class
class History extends HistoryModel {
  /// Initializes
  History({
    @required List<double> prices,
    @required List<int> times,
  }) : super(
          prices: prices,
          times: times,
        );

  /// Creates an instance from JSON
  factory History.fromJson(Map<String, dynamic> json) => History(
        prices: List<double>.from(json['prices'].map((x) => x)),
        times: List<int>.from(json['times'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['prices'] = prices;
    result['times'] = times;

    return result;
  }

  /// Creates a copy of instance with given parameters
  History copyWith({
    List<double> prices,
    List<int> times,
  }) =>
      History(
        prices: prices ?? this.prices,
        times: times ?? this.times,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
