import 'package:meta/meta.dart';

import '../../basic_api/generated/trading_times_receive.dart';
import '../../basic_api/generated/trading_times_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Trading times response model class
abstract class TradingTimesResponseModel {
  /// Initializes
  TradingTimesResponseModel({
    @required this.tradingTimes,
  });

  /// The trading times structure is a hierarchy as follows: Market -> SubMarket -> Underlyings
  final TradingTimes tradingTimes;
}

/// Trading times response class
class TradingTimesResponse extends TradingTimesResponseModel {
  /// Initializes
  TradingTimesResponse({
    @required TradingTimes tradingTimes,
  }) : super(
          tradingTimes: tradingTimes,
        );

  /// Creates an instance from JSON
  factory TradingTimesResponse.fromJson(
    dynamic tradingTimesJson,
  ) =>
      TradingTimesResponse(
        tradingTimes: tradingTimesJson == null
            ? null
            : TradingTimes.fromJson(tradingTimesJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingTimes != null) {
      resultMap['trading_times'] = tradingTimes.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Receives a list of market opening times for a given date.
  ///
  /// For parameters information refer to [TradingTimesRequest].
  /// Throws a [TradingException] if API response contains an error
  static Future<TradingTimesResponse> fetchTradingTimes(
    TradingTimesSend request,
  ) async {
    final TradingTimesReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          TradingException(baseExceptionModel: baseExceptionModel),
    );

    return TradingTimesResponse.fromJson(response.tradingTimes);
  }

  /// Creates a copy of instance with given parameters
  TradingTimesResponse copyWith({
    TradingTimes tradingTimes,
  }) =>
      TradingTimesResponse(
        tradingTimes: tradingTimes ?? this.tradingTimes,
      );
}

final Map<String, TradingDaysItemEnum> tradingDaysItemEnumMapper =
    <String, TradingDaysItemEnum>{
  "Sun": TradingDaysItemEnum.sun,
  "Mon": TradingDaysItemEnum.mon,
  "Tue": TradingDaysItemEnum.tue,
  "Wed": TradingDaysItemEnum.wed,
  "Thu": TradingDaysItemEnum.thu,
  "Fri": TradingDaysItemEnum.fri,
  "Sat": TradingDaysItemEnum.sat,
};

/// trading_daysItem Enum
enum TradingDaysItemEnum {
  sun,
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
}
/// Trading times model class
abstract class TradingTimesModel {
  /// Initializes
  TradingTimesModel({
    @required this.markets,
  });

  /// An array of markets
  final List<MarketsItem> markets;
}

/// Trading times class
class TradingTimes extends TradingTimesModel {
  /// Initializes
  TradingTimes({
    @required List<MarketsItem> markets,
  }) : super(
          markets: markets,
        );

  /// Creates an instance from JSON
  factory TradingTimes.fromJson(Map<String, dynamic> json) => TradingTimes(
        markets: json['markets'] == null
            ? null
            : List<MarketsItem>.from(json['markets']
                .map((dynamic item) => MarketsItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (markets != null) {
      resultMap['markets'] =
          markets.map<dynamic>((MarketsItem item) => item.toJson()).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TradingTimes copyWith({
    List<MarketsItem> markets,
  }) =>
      TradingTimes(
        markets: markets ?? this.markets,
      );
}
/// Markets item model class
abstract class MarketsItemModel {
  /// Initializes
  MarketsItemModel({
    @required this.name,
    @required this.submarkets,
  });

  /// Market name
  final String name;

  /// An array of submarkets
  final List<SubmarketsItem> submarkets;
}

/// Markets item class
class MarketsItem extends MarketsItemModel {
  /// Initializes
  MarketsItem({
    @required String name,
    @required List<SubmarketsItem> submarkets,
  }) : super(
          name: name,
          submarkets: submarkets,
        );

  /// Creates an instance from JSON
  factory MarketsItem.fromJson(Map<String, dynamic> json) => MarketsItem(
        name: json['name'],
        submarkets: json['submarkets'] == null
            ? null
            : List<SubmarketsItem>.from(json['submarkets']
                .map((dynamic item) => SubmarketsItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['name'] = name;
    if (submarkets != null) {
      resultMap['submarkets'] = submarkets
          .map<dynamic>((SubmarketsItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MarketsItem copyWith({
    String name,
    List<SubmarketsItem> submarkets,
  }) =>
      MarketsItem(
        name: name ?? this.name,
        submarkets: submarkets ?? this.submarkets,
      );
}
/// Submarkets item model class
abstract class SubmarketsItemModel {
  /// Initializes
  SubmarketsItemModel({
    @required this.name,
    @required this.symbols,
  });

  /// Submarket name
  final String name;

  /// Symbols array
  final List<SymbolsItem> symbols;
}

/// Submarkets item class
class SubmarketsItem extends SubmarketsItemModel {
  /// Initializes
  SubmarketsItem({
    @required String name,
    @required List<SymbolsItem> symbols,
  }) : super(
          name: name,
          symbols: symbols,
        );

  /// Creates an instance from JSON
  factory SubmarketsItem.fromJson(Map<String, dynamic> json) => SubmarketsItem(
        name: json['name'],
        symbols: json['symbols'] == null
            ? null
            : List<SymbolsItem>.from(json['symbols']
                .map((dynamic item) => SymbolsItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['name'] = name;
    if (symbols != null) {
      resultMap['symbols'] =
          symbols.map<dynamic>((SymbolsItem item) => item.toJson()).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  SubmarketsItem copyWith({
    String name,
    List<SymbolsItem> symbols,
  }) =>
      SubmarketsItem(
        name: name ?? this.name,
        symbols: symbols ?? this.symbols,
      );
}
/// Symbols item model class
abstract class SymbolsItemModel {
  /// Initializes
  SymbolsItemModel({
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
  final List<TradingDaysItemEnum> tradingDays;
}

/// Symbols item class
class SymbolsItem extends SymbolsItemModel {
  /// Initializes
  SymbolsItem({
    @required List<dynamic> events,
    @required String name,
    @required String symbol,
    @required Map<String, dynamic> times,
    @required List<TradingDaysItemEnum> tradingDays,
  }) : super(
          events: events,
          name: name,
          symbol: symbol,
          times: times,
          tradingDays: tradingDays,
        );

  /// Creates an instance from JSON
  factory SymbolsItem.fromJson(Map<String, dynamic> json) => SymbolsItem(
        events: json['events'] == null
            ? null
            : List<dynamic>.from(json['events'].map((dynamic item) => item)),
        name: json['name'],
        symbol: json['symbol'],
        times: json['times'],
        tradingDays: json['trading_days'] == null
            ? null
            : List<TradingDaysItemEnum>.from(json['trading_days']
                .map((dynamic item) => tradingDaysItemEnumMapper[item])),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (events != null) {
      resultMap['events'] =
          events.map<dynamic>((dynamic item) => item).toList();
    }
    resultMap['name'] = name;
    resultMap['symbol'] = symbol;
    resultMap['times'] = times;
    if (tradingDays != null) {
      resultMap['trading_days'] = tradingDays
          .map<dynamic>((TradingDaysItemEnum item) => tradingDaysItemEnumMapper
              .entries
              .firstWhere((entry) => entry.value == item, orElse: () => null)
              ?.key)
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  SymbolsItem copyWith({
    List<dynamic> events,
    String name,
    String symbol,
    Map<String, dynamic> times,
    List<TradingDaysItemEnum> tradingDays,
  }) =>
      SymbolsItem(
        events: events ?? this.events,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        times: times ?? this.times,
        tradingDays: tradingDays ?? this.tradingDays,
      );
}
