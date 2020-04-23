import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/symbol_model.dart';
import 'package:flutter_deriv_api/api/models/trade_duration_model.dart';

/// Trading duration model class
class TradingDurationDataModel extends BaseModel {
  /// Class constructor
  TradingDurationDataModel({
    this.symbols,
    this.tradeDurations,
  });

  /// Creates instance from json
  factory TradingDurationDataModel.fromJson(Map<String, dynamic> json) =>
      TradingDurationDataModel(
        symbols: json['symbol'] == null
            ? null
            : json['symbol']
                .map<SymbolModel>((dynamic item) => SymbolModel.fromJson(item))
                .toList(),
        tradeDurations: json['trade_durations'] == null
            ? null
            : json['trade_durations']
                .map<TradeDurationModel>(
                    (dynamic item) => TradeDurationModel.fromJson(item))
                .toList(),
      );

  /// List of underlying symbols.
  final List<SymbolModel> symbols;

  /// List of trade durations available for symbols and contract combinations.
  final List<TradeDurationModel> tradeDurations;

  /// Creates copy of instance with given parameters
  TradingDurationDataModel copyWith({
    List<SymbolModel> symbols,
    List<TradeDurationModel> tradeDurations,
  }) =>
      TradingDurationDataModel(
        symbols: symbols ?? this.symbols,
        tradeDurations: tradeDurations ?? this.tradeDurations,
      );
}
