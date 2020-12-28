/// Ticks receive model class
abstract class TicksReceiveModel {
  /// Initializes
  TicksReceiveModel({
    @required this.tick,
    @required this.subscription,
  });

  /// Tick by tick list of streamed data
  final Tick tick;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Ticks receive class
class TicksReceive extends TicksReceiveModel {
  /// Initializes
  TicksReceive({
    @required Tick tick,
    @required Subscription subscription,
  }) : super(
          tick: tick,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory TicksReceive.fromJson(Map<String, dynamic> json) => TicksReceive(
        tick: json['tick'] == null ? null : Tick.fromJson(json['tick']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (tick != null) {
      result['tick'] = tick.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TicksReceive copyWith({
    Tick tick,
    Subscription subscription,
  }) =>
      TicksReceive(
        tick: tick ?? this.tick,
        subscription: subscription ?? this.subscription,
      );
}
/// Tick model class
abstract class TickModel {
  /// Initializes
  TickModel({
    @required this.ask,
    @required this.bid,
    @required this.epoch,
    @required this.id,
    @required this.pipSize,
    @required this.quote,
    @required this.symbol,
  });

  /// Market ask at the epoch
  final double ask;

  /// Market bid at the epoch
  final double bid;

  /// Epoch time of the tick
  final int epoch;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final double pipSize;

  /// Market value at the epoch
  final double quote;

  /// Symbol
  final String symbol;
}

/// Tick class
class Tick extends TickModel {
  /// Initializes
  Tick({
    @required double ask,
    @required double bid,
    @required int epoch,
    @required String id,
    @required double pipSize,
    @required double quote,
    @required String symbol,
  }) : super(
          ask: ask,
          bid: bid,
          epoch: epoch,
          id: id,
          pipSize: pipSize,
          quote: quote,
          symbol: symbol,
        );

  /// Creates an instance from JSON
  factory Tick.fromJson(Map<String, dynamic> json) => Tick(
        ask: getDouble(json['ask']),
        bid: getDouble(json['bid']),
        epoch: json['epoch'],
        id: json['id'],
        pipSize: getDouble(json['pip_size']),
        quote: getDouble(json['quote']),
        symbol: json['symbol'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['ask'] = ask;
    result['bid'] = bid;
    result['epoch'] = epoch;
    result['id'] = id;
    result['pip_size'] = pipSize;
    result['quote'] = quote;
    result['symbol'] = symbol;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Tick copyWith({
    double ask,
    double bid,
    int epoch,
    String id,
    double pipSize,
    double quote,
    String symbol,
  }) =>
      Tick(
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        epoch: epoch ?? this.epoch,
        id: id ?? this.id,
        pipSize: pipSize ?? this.pipSize,
        quote: quote ?? this.quote,
        symbol: symbol ?? this.symbol,
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
