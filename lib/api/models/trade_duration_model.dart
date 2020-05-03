import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/duration_model.dart';
import 'package:flutter_deriv_api/api/models/trade_type_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Trade duration class
class TradeDurationModel extends BaseModel {
  /// Initializes
  TradeDurationModel({
    this.durations,
    this.tradeType,
  });

  /// Creates instance from json
  factory TradeDurationModel.fromJson(Map<String, dynamic> json) =>
      TradeDurationModel(
        durations: getListFromMap(
          json['durations'],
          itemToTypeCallback: (dynamic item) => DurationModel.fromJson(item),
        ),
        tradeType: getItemFromMap(
          json['trade_type'],
          itemToTypeCallback: (dynamic item) => TradeTypeModel.fromJson(item),
        ),
      );

  /// List of trade durations available for the symbols.
  final List<DurationModel> durations;

  /// List of trade types available for the symbols.
  final TradeTypeModel tradeType;

  /// Creates copy of instance with given parameters
  TradeDurationModel copyWith({
    List<DurationModel> durations,
    TradeTypeModel tradeType,
  }) =>
      TradeDurationModel(
        durations: durations ?? this.durations,
        tradeType: tradeType ?? this.tradeType,
      );
}
