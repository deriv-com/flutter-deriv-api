import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/trade_event_model.dart';
import 'package:flutter_deriv_api/api/models/trade_times_model.dart';

/// Symbol class
class SymbolModel extends BaseModel {
  /// Class constructor
  SymbolModel({
    this.displayName,
    this.name,
    this.events,
    this.symbol,
    this.times,
  });

  /// Creates instance from json
  factory SymbolModel.fromJson(Map<String, dynamic> json) => SymbolModel(
        displayName: json['display_name'],
        name: json['name'],
        events: json['events'] == null
            ? null
            : json['events']
                .map<TradeEventModel>(
                    (dynamic item) => TradeEventModel.fromJson(item))
                .toList(),
        symbol: json['symbol'],
        times: json['times'] == null
            ? null
            : TradeTimesModel.fromJson(json['times']),
      );

  /// Translated symbol name.
  final String displayName;

  /// Symbol name.
  final String name;

  /// Events
  List<TradeEventModel> events;

  /// Symbol
  String symbol;

  /// Trade Times
  TradeTimesModel times;

  /// Creates copy of instance with given parameters
  SymbolModel copyWith({
    String displayName,
    String name,
    List<TradeEventModel> events,
    String symbol,
    TradeTimesModel times,
  }) =>
      SymbolModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
        events: events ?? this.events,
        symbol: symbol ?? this.symbol,
        times: times ?? this.times,
      );
}
