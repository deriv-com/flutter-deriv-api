// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_times_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_times_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Trading times response model class.
abstract class TradingTimesResponseModel {
  /// Initializes Trading times response model class .
  const TradingTimesResponseModel({
    this.tradingTimes,
  });

  /// The trading times structure is a hierarchy as follows: Market -> SubMarket -> Underlyings
  final TradingTimes? tradingTimes;
}

/// Trading times response class.
class TradingTimesResponse extends TradingTimesResponseModel {
  /// Initializes Trading times response class.
  const TradingTimesResponse({
    TradingTimes? tradingTimes,
  }) : super(
          tradingTimes: tradingTimes,
        );

  /// Creates an instance from JSON.
  factory TradingTimesResponse.fromJson(
    dynamic tradingTimesJson,
  ) =>
      TradingTimesResponse(
        tradingTimes: tradingTimesJson == null
            ? null
            : TradingTimes.fromJson(tradingTimesJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingTimes != null) {
      resultMap['trading_times'] = tradingTimes!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector().get<BaseAPI>()!;

  /// Receives a list of market opening times for a given date.
  ///
  /// For parameters information refer to [TradingTimesRequest].
  /// Throws a [TradingException] if API response contains an error
  static Future<TradingTimesResponse> fetchTradingTimes(
    TradingTimesRequest request,
  ) async {
    final TradingTimesReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TradingException(baseExceptionModel: baseExceptionModel),
    );

    return TradingTimesResponse.fromJson(response.tradingTimes);
  }

  /// Creates a copy of instance with given parameters.
  TradingTimesResponse copyWith({
    TradingTimes? tradingTimes,
  }) =>
      TradingTimesResponse(
        tradingTimes: tradingTimes ?? this.tradingTimes,
      );
}

/// TradingDaysItemEnum mapper.
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

/// TradingDaysItem Enum.
enum TradingDaysItemEnum {
  /// Sun.
  sun,

  /// Mon.
  mon,

  /// Tue.
  tue,

  /// Wed.
  wed,

  /// Thu.
  thu,

  /// Fri.
  fri,

  /// Sat.
  sat,
}

/// Trading times model class.
abstract class TradingTimesModel {
  /// Initializes Trading times model class .
  const TradingTimesModel({
    required this.markets,
  });

  /// An array of markets
  final List<MarketsItem> markets;
}

/// Trading times class.
class TradingTimes extends TradingTimesModel {
  /// Initializes Trading times class.
  const TradingTimes({
    required List<MarketsItem> markets,
  }) : super(
          markets: markets,
        );

  /// Creates an instance from JSON.
  factory TradingTimes.fromJson(Map<String, dynamic> json) => TradingTimes(
        markets: List<MarketsItem>.from(
          json['markets'].map(
            (dynamic item) => MarketsItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['markets'] = markets
        .map<dynamic>(
          (MarketsItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingTimes copyWith({
    List<MarketsItem>? markets,
  }) =>
      TradingTimes(
        markets: markets ?? this.markets,
      );
}

/// Markets item model class.
abstract class MarketsItemModel {
  /// Initializes Markets item model class .
  const MarketsItemModel({
    required this.name,
    this.submarkets,
  });

  /// Market name
  final String name;

  /// An array of submarkets
  final List<SubmarketsItem>? submarkets;
}

/// Markets item class.
class MarketsItem extends MarketsItemModel {
  /// Initializes Markets item class.
  const MarketsItem({
    required String name,
    List<SubmarketsItem>? submarkets,
  }) : super(
          name: name,
          submarkets: submarkets,
        );

  /// Creates an instance from JSON.
  factory MarketsItem.fromJson(Map<String, dynamic> json) => MarketsItem(
        name: json['name'],
        submarkets: json['submarkets'] == null
            ? null
            : List<SubmarketsItem>.from(
                json['submarkets']?.map(
                  (dynamic item) => SubmarketsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['name'] = name;
    if (submarkets != null) {
      resultMap['submarkets'] = submarkets!
          .map<dynamic>(
            (SubmarketsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MarketsItem copyWith({
    String? name,
    List<SubmarketsItem>? submarkets,
  }) =>
      MarketsItem(
        name: name ?? this.name,
        submarkets: submarkets ?? this.submarkets,
      );
}

/// Submarkets item model class.
abstract class SubmarketsItemModel {
  /// Initializes Submarkets item model class .
  const SubmarketsItemModel({
    required this.name,
    this.symbols,
  });

  /// Submarket name
  final String name;

  /// Symbols array
  final List<SymbolsItem>? symbols;
}

/// Submarkets item class.
class SubmarketsItem extends SubmarketsItemModel {
  /// Initializes Submarkets item class.
  const SubmarketsItem({
    required String name,
    List<SymbolsItem>? symbols,
  }) : super(
          name: name,
          symbols: symbols,
        );

  /// Creates an instance from JSON.
  factory SubmarketsItem.fromJson(Map<String, dynamic> json) => SubmarketsItem(
        name: json['name'],
        symbols: json['symbols'] == null
            ? null
            : List<SymbolsItem>.from(
                json['symbols']?.map(
                  (dynamic item) => SymbolsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['name'] = name;
    if (symbols != null) {
      resultMap['symbols'] = symbols!
          .map<dynamic>(
            (SymbolsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SubmarketsItem copyWith({
    String? name,
    List<SymbolsItem>? symbols,
  }) =>
      SubmarketsItem(
        name: name ?? this.name,
        symbols: symbols ?? this.symbols,
      );
}

/// Symbols item model class.
abstract class SymbolsItemModel {
  /// Initializes Symbols item model class .
  const SymbolsItemModel({
    required this.symbol,
    required this.name,
    this.events,
    this.times,
    this.tradingDays,
  });

  /// Symbol shortcode
  final String symbol;

  /// Symbol name
  final String name;

  /// Events
  final List<dynamic>? events;

  /// Open, close and settlement times
  final Map<String, dynamic>? times;

  /// Trading days
  final List<TradingDaysItemEnum>? tradingDays;
}

/// Symbols item class.
class SymbolsItem extends SymbolsItemModel {
  /// Initializes Symbols item class.
  const SymbolsItem({
    required String name,
    required String symbol,
    List<dynamic>? events,
    Map<String, dynamic>? times,
    List<TradingDaysItemEnum>? tradingDays,
  }) : super(
          name: name,
          symbol: symbol,
          events: events,
          times: times,
          tradingDays: tradingDays,
        );

  /// Creates an instance from JSON.
  factory SymbolsItem.fromJson(Map<String, dynamic> json) => SymbolsItem(
        name: json['name'],
        symbol: json['symbol'],
        events: json['events'] == null
            ? null
            : List<dynamic>.from(
                json['events']?.map(
                  (dynamic item) => item,
                ),
              ),
        times: json['times'],
        tradingDays: json['trading_days'] == null
            ? null
            : List<TradingDaysItemEnum>.from(
                json['trading_days']?.map(
                  (dynamic item) =>
                      item == null ? null : tradingDaysItemEnumMapper[item],
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['name'] = name;
    resultMap['symbol'] = symbol;
    if (events != null) {
      resultMap['events'] = events!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    resultMap['times'] = times;
    if (tradingDays != null) {
      resultMap['trading_days'] = tradingDays!
          .map<dynamic>(
            (TradingDaysItemEnum item) => tradingDaysItemEnumMapper.entries
                .firstWhere((MapEntry<String, TradingDaysItemEnum> entry) =>
                    entry.value == item)
                .key,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SymbolsItem copyWith({
    String? name,
    String? symbol,
    List<dynamic>? events,
    Map<String, dynamic>? times,
    List<TradingDaysItemEnum>? tradingDays,
  }) =>
      SymbolsItem(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        events: events ?? this.events,
        times: times ?? this.times,
        tradingDays: tradingDays ?? this.tradingDays,
      );
}
