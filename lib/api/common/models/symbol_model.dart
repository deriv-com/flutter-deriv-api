import 'package:flutter_deriv_api/api/common/models/trade_event_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_times_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Symbol class
class SymbolModel extends APIBaseModel {
  /// Initializes
  SymbolModel({
    this.displayName,
    this.name,
    this.events,
    this.symbol,
    this.times,
    this.tradingDays,
  });

  /// Creates an instance from JSON
  factory SymbolModel.fromJson(Map<String, dynamic> json) => SymbolModel(
        displayName: json['display_name'],
        name: json['name'],
        events: getListFromMap(
          json['events'],
          itemToTypeCallback: (dynamic item) => TradeEventModel.fromJson(item),
        ),
        symbol: json['symbol'],
        times: getItemFromMap(
          json['times'],
          itemToTypeCallback: (dynamic item) => TradeTimesModel.fromJson(item),
        ),
        tradingDays: getListFromMap(
          json['trading_days'],
          itemToTypeCallback: (dynamic item) => item,
        ),
      );

  /// Translated symbol name.
  final String? displayName;

  /// Symbol name.
  final String? name;

  /// Events
  final List<TradeEventModel?>? events;

  /// Symbol
  final String? symbol;

  /// Trade Times
  final TradeTimesModel? times;

  /// Trading days.
  final List<String?>? tradingDays;

  /// Creates a copy of instance with given parameters
  SymbolModel copyWith({
    String? displayName,
    String? name,
    List<TradeEventModel>? events,
    String? symbol,
    TradeTimesModel? times,
    List<String?>? tradingDays,
  }) =>
      SymbolModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
        events: events ?? this.events,
        symbol: symbol ?? this.symbol,
        times: times ?? this.times,
        tradingDays: tradingDays ?? this.tradingDays,
      );
}
