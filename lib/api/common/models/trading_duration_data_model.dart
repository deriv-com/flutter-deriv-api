import 'package:flutter_deriv_api/api/common/models/symbol_model.dart';
import 'package:flutter_deriv_api/api/common/models/trade_duration_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading duration model class
class TradingDurationDataModel extends APIBaseModel {
  /// Initializes
  TradingDurationDataModel({
    this.symbols,
    this.tradeDurations,
  });

  /// Creates an instance from JSON
  factory TradingDurationDataModel.fromJson(Map<String, dynamic> json) =>
      TradingDurationDataModel(
        symbols: getListFromMap(
          json['symbol'],
          itemToTypeCallback: (dynamic item) => SymbolModel.fromJson(item),
        ),
        tradeDurations: getListFromMap(
          json['trade_durations'],
          itemToTypeCallback: (dynamic item) =>
              TradeDurationModel.fromJson(item),
        ),
      );

  /// List of underlying symbols.
  final List<SymbolModel?>? symbols;

  /// List of trade durations available for symbols and contract combinations.
  final List<TradeDurationModel?>? tradeDurations;

  /// Creates a copy of instance with given parameters
  TradingDurationDataModel copyWith({
    List<SymbolModel>? symbols,
    List<TradeDurationModel>? tradeDurations,
  }) =>
      TradingDurationDataModel(
        symbols: symbols ?? this.symbols,
        tradeDurations: tradeDurations ?? this.tradeDurations,
      );
}
