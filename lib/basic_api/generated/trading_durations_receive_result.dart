/// Trading durations receive model class
abstract class TradingDurationsReceiveModel {
  /// Initializes
  TradingDurationsReceiveModel({
    @required this.tradingDurations,
  });

  /// List of underlyings by their display name and symbol followed by their available contract types and trading duration boundaries.
  final List<TradingDuration> tradingDurations;
}

/// Trading durations receive class
class TradingDurationsReceive extends TradingDurationsReceiveModel {
  /// Initializes
  TradingDurationsReceive({
    @required List<TradingDuration> tradingDurations,
  }) : super(
          tradingDurations: tradingDurations,
        );

  /// Creates an instance from JSON
  factory TradingDurationsReceive.fromJson(Map<String, dynamic> json) =>
      TradingDurationsReceive(
        tradingDurations: json['trading_durations'] == null
            ? null
            : json['trading_durations']
                .map<TradingDuration>(
                    (dynamic item) => TradingDuration.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (tradingDurations != null) {
      result['trading_durations'] =
          tradingDurations.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradingDurationsReceive copyWith({
    List<TradingDuration> tradingDurations,
  }) =>
      TradingDurationsReceive(
        tradingDurations: tradingDurations ?? this.tradingDurations,
      );
}
/// Trading duration model class
abstract class TradingDurationModel {
  /// Initializes
  TradingDurationModel({
    @required this.market,
    @required this.submarket,
    @required this.symbol,
    @required this.tradeDurations,
  });

  /// The market in which the underlyings listed in `symbol` located.
  final Market market;

  /// The submarket in which the underlyings listed in `symbol` located.
  final Submarket submarket;

  /// List of underlying symbols.
  final List<Symbol> symbol;

  /// List of trade durations available for symbols and contract combinations.
  final List<TradeDuration> tradeDurations;
}

/// Trading duration class
class TradingDuration extends TradingDurationModel {
  /// Initializes
  TradingDuration({
    @required Market market,
    @required Submarket submarket,
    @required List<Symbol> symbol,
    @required List<TradeDuration> tradeDurations,
  }) : super(
          market: market,
          submarket: submarket,
          symbol: symbol,
          tradeDurations: tradeDurations,
        );

  /// Creates an instance from JSON
  factory TradingDuration.fromJson(Map<String, dynamic> json) =>
      TradingDuration(
        market: json['market'] == null ? null : Market.fromJson(json['market']),
        submarket: json['submarket'] == null
            ? null
            : Submarket.fromJson(json['submarket']),
        symbol: json['symbol'] == null
            ? null
            : json['symbol']
                .map<Symbol>((dynamic item) => Symbol.fromJson(item))
                .toList(),
        tradeDurations: json['trade_durations'] == null
            ? null
            : json['trade_durations']
                .map<TradeDuration>(
                    (dynamic item) => TradeDuration.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (market != null) {
      result['market'] = market.toJson();
    }
    if (submarket != null) {
      result['submarket'] = submarket.toJson();
    }
    if (symbol != null) {
      result['symbol'] = symbol.map((item) => item.toJson()).toList();
    }
    if (tradeDurations != null) {
      result['trade_durations'] =
          tradeDurations.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradingDuration copyWith({
    Market market,
    Submarket submarket,
    List<Symbol> symbol,
    List<TradeDuration> tradeDurations,
  }) =>
      TradingDuration(
        market: market ?? this.market,
        submarket: submarket ?? this.submarket,
        symbol: symbol ?? this.symbol,
        tradeDurations: tradeDurations ?? this.tradeDurations,
      );
}
/// Market model class
abstract class MarketModel {
  /// Initializes
  MarketModel({
    @required this.displayName,
    @required this.name,
  });

  /// Translated market name.
  final String displayName;

  /// Market name.
  final String name;
}

/// Market class
class Market extends MarketModel {
  /// Initializes
  Market({
    @required String displayName,
    @required String name,
  }) : super(
          displayName: displayName,
          name: name,
        );

  /// Creates an instance from JSON
  factory Market.fromJson(Map<String, dynamic> json) => Market(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Market copyWith({
    String displayName,
    String name,
  }) =>
      Market(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
/// Submarket model class
abstract class SubmarketModel {
  /// Initializes
  SubmarketModel({
    @required this.displayName,
    @required this.name,
  });

  /// Translated submarket name.
  final String displayName;

  /// Submarket name.
  final String name;
}

/// Submarket class
class Submarket extends SubmarketModel {
  /// Initializes
  Submarket({
    @required String displayName,
    @required String name,
  }) : super(
          displayName: displayName,
          name: name,
        );

  /// Creates an instance from JSON
  factory Submarket.fromJson(Map<String, dynamic> json) => Submarket(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Submarket copyWith({
    String displayName,
    String name,
  }) =>
      Submarket(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
/// Symbol model class
abstract class SymbolModel {
  /// Initializes
  SymbolModel({
    @required this.displayName,
    @required this.name,
  });

  /// Translated symbol name.
  final String displayName;

  /// Symbol name.
  final String name;
}

/// Symbol class
class Symbol extends SymbolModel {
  /// Initializes
  Symbol({
    @required String displayName,
    @required String name,
  }) : super(
          displayName: displayName,
          name: name,
        );

  /// Creates an instance from JSON
  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Symbol copyWith({
    String displayName,
    String name,
  }) =>
      Symbol(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
/// Trade duration model class
abstract class TradeDurationModel {
  /// Initializes
  TradeDurationModel({
    @required this.durations,
    @required this.tradeType,
  });

  /// List of trade durations available for the symbols.
  final List<Duration> durations;

  /// List of trade types available for the symbols.
  final TradeType tradeType;
}

/// Trade duration class
class TradeDuration extends TradeDurationModel {
  /// Initializes
  TradeDuration({
    @required List<Duration> durations,
    @required TradeType tradeType,
  }) : super(
          durations: durations,
          tradeType: tradeType,
        );

  /// Creates an instance from JSON
  factory TradeDuration.fromJson(Map<String, dynamic> json) => TradeDuration(
        durations: json['durations'] == null
            ? null
            : json['durations']
                .map<Duration>((dynamic item) => Duration.fromJson(item))
                .toList(),
        tradeType: json['trade_type'] == null
            ? null
            : TradeType.fromJson(json['trade_type']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (durations != null) {
      result['durations'] = durations.map((item) => item.toJson()).toList();
    }
    if (tradeType != null) {
      result['trade_type'] = tradeType.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradeDuration copyWith({
    List<Duration> durations,
    TradeType tradeType,
  }) =>
      TradeDuration(
        durations: durations ?? this.durations,
        tradeType: tradeType ?? this.tradeType,
      );
}
/// Duration model class
abstract class DurationModel {
  /// Initializes
  DurationModel({
    @required this.displayName,
    @required this.max,
    @required this.min,
    @required this.name,
  });

  /// Translated duration type name.
  final String displayName;

  /// Maximum allowed duration for this type.
  final int max;

  /// Minimum allowed duration for this type.
  final int min;

  /// Duration type name.
  final String name;
}

/// Duration class
class Duration extends DurationModel {
  /// Initializes
  Duration({
    @required String displayName,
    @required int max,
    @required int min,
    @required String name,
  }) : super(
          displayName: displayName,
          max: max,
          min: min,
          name: name,
        );

  /// Creates an instance from JSON
  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        displayName: json['display_name'],
        max: json['max'],
        min: json['min'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['max'] = max;
    result['min'] = min;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Duration copyWith({
    String displayName,
    int max,
    int min,
    String name,
  }) =>
      Duration(
        displayName: displayName ?? this.displayName,
        max: max ?? this.max,
        min: min ?? this.min,
        name: name ?? this.name,
      );
}
/// Trade type model class
abstract class TradeTypeModel {
  /// Initializes
  TradeTypeModel({
    @required this.displayName,
    @required this.name,
  });

  /// Translated trade type name.
  final String displayName;

  /// Trade type name.
  final String name;
}

/// Trade type class
class TradeType extends TradeTypeModel {
  /// Initializes
  TradeType({
    @required String displayName,
    @required String name,
  }) : super(
          displayName: displayName,
          name: name,
        );

  /// Creates an instance from JSON
  factory TradeType.fromJson(Map<String, dynamic> json) => TradeType(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradeType copyWith({
    String displayName,
    String name,
  }) =>
      TradeType(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
