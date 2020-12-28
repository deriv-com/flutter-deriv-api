/// Trading times receive model class
abstract class TradingTimesReceiveModel {
  /// Initializes
  TradingTimesReceiveModel({
    @required this.tradingTimes,
  });

  /// The trading times structure is a hierarchy as follows: Market -> SubMarket -> Underlyings
  final TradingTimes tradingTimes;
}

/// Trading times receive class
class TradingTimesReceive extends TradingTimesReceiveModel {
  /// Initializes
  TradingTimesReceive({
    @required TradingTimes tradingTimes,
  }) : super(
          tradingTimes: tradingTimes,
        );

  /// Creates an instance from JSON
  factory TradingTimesReceive.fromJson(Map<String, dynamic> json) =>
      TradingTimesReceive(
        tradingTimes: json['trading_times'] == null
            ? null
            : TradingTimes.fromJson(json['trading_times']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (tradingTimes != null) {
      result['trading_times'] = tradingTimes.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradingTimesReceive copyWith({
    TradingTimes tradingTimes,
  }) =>
      TradingTimesReceive(
        tradingTimes: tradingTimes ?? this.tradingTimes,
      );
}
/// Trading times model class
abstract class TradingTimesModel {
  /// Initializes
  TradingTimesModel({
    @required this.markets,
  });

  /// An array of markets
  final List<Market> markets;
}

/// Trading times class
class TradingTimes extends TradingTimesModel {
  /// Initializes
  TradingTimes({
    @required List<Market> markets,
  }) : super(
          markets: markets,
        );

  /// Creates an instance from JSON
  factory TradingTimes.fromJson(Map<String, dynamic> json) => TradingTimes(
        markets: json['markets'] == null
            ? null
            : json['markets']
                .map<Market>((dynamic item) => Market.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (markets != null) {
      result['markets'] = markets.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradingTimes copyWith({
    List<Market> markets,
  }) =>
      TradingTimes(
        markets: markets ?? this.markets,
      );
}
/// Market model class
abstract class MarketModel {
  /// Initializes
  MarketModel({
    @required this.name,
    @required this.submarkets,
  });

  /// Market name
  final String name;

  /// An array of submarkets
  final List<Submarket> submarkets;
}

/// Market class
class Market extends MarketModel {
  /// Initializes
  Market({
    @required String name,
    @required List<Submarket> submarkets,
  }) : super(
          name: name,
          submarkets: submarkets,
        );

  /// Creates an instance from JSON
  factory Market.fromJson(Map<String, dynamic> json) => Market(
        name: json['name'],
        submarkets: json['submarkets'] == null
            ? null
            : json['submarkets']
                .map<Submarket>((dynamic item) => Submarket.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['name'] = name;
    if (submarkets != null) {
      result['submarkets'] = submarkets.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Market copyWith({
    String name,
    List<Submarket> submarkets,
  }) =>
      Market(
        name: name ?? this.name,
        submarkets: submarkets ?? this.submarkets,
      );
}
/// Submarket model class
abstract class SubmarketModel {
  /// Initializes
  SubmarketModel({
    @required this.name,
    @required this.symbols,
  });

  /// Submarket name
  final String name;

  /// Symbols array
  final List<Symbol> symbols;
}

/// Submarket class
class Submarket extends SubmarketModel {
  /// Initializes
  Submarket({
    @required String name,
    @required List<Symbol> symbols,
  }) : super(
          name: name,
          symbols: symbols,
        );

  /// Creates an instance from JSON
  factory Submarket.fromJson(Map<String, dynamic> json) => Submarket(
        name: json['name'],
        symbols: json['symbols'] == null
            ? null
            : json['symbols']
                .map<Symbol>((dynamic item) => Symbol.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['name'] = name;
    if (symbols != null) {
      result['symbols'] = symbols.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Submarket copyWith({
    String name,
    List<Symbol> symbols,
  }) =>
      Submarket(
        name: name ?? this.name,
        symbols: symbols ?? this.symbols,
      );
}
/// Symbol model class
abstract class SymbolModel {
  /// Initializes
  SymbolModel({
    @required this.events,
    @required this.name,
    @required this.symbol,
    @required this.times,
    @required this.tradingDays,
  });

  /// Events
  final List<dynamic> events;

  /// Symbol name
  final String name;

  /// Symbol shortcode
  final String symbol;

  /// Open, close and settlement times
  final Map<String, dynamic> times;

  /// Trading days
  final List<TradingDaysEnum> tradingDays;
}

/// Symbol class
class Symbol extends SymbolModel {
  /// Initializes
  Symbol({
    @required List<dynamic> events,
    @required String name,
    @required String symbol,
    @required Map<String, dynamic> times,
    @required List<TradingDaysEnum> tradingDays,
  }) : super(
          events: events,
          name: name,
          symbol: symbol,
          times: times,
          tradingDays: tradingDays,
        );

  /// Creates an instance from JSON
  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        name: json['name'],
        symbol: json['symbol'],
        times: json['times'],
        tradingDays: List<TradingDaysEnum>.from(json['trading_days'].map((x) =>
            tradingDaysEnumMapper.entries
                .firstWhere((entry) => entry.value == x, orElse: () => null)
                ?.key)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['events'] = events;
    result['name'] = name;
    result['symbol'] = symbol;
    result['times'] = times;
    if (tradingDays != null) {
      result['trading_days'] =
          tradingDays.map((item) => tradingDaysEnumMapper[item]).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Symbol copyWith({
    List<dynamic> events,
    String name,
    String symbol,
    Map<String, dynamic> times,
    List<TradingDaysEnum> tradingDays,
  }) =>
      Symbol(
        events: events ?? this.events,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        times: times ?? this.times,
        tradingDays: tradingDays ?? this.tradingDays,
      );
  // Creating Enum Mappers

  static final Map<TradingDaysEnum, String> tradingDaysEnumMapper = {
    TradingDaysEnum.Sun: 'Sun',
    TradingDaysEnum.Mon: 'Mon',
    TradingDaysEnum.Tue: 'Tue',
    TradingDaysEnum.Wed: 'Wed',
    TradingDaysEnum.Thu: 'Thu',
    TradingDaysEnum.Fri: 'Fri',
    TradingDaysEnum.Sat: 'Sat',
  };
}

// Creating Enums

enum TradingDaysEnum {
  Sun,
  Mon,
  Tue,
  Wed,
  Thu,
  Fri,
  Sat,
}
