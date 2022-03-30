import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Represents the net change in equity per [time]
class ProfitableTradeModel extends APIBaseModel {
  /// Initializes
  ProfitableTradeModel({this.profit, this.time});

  /// Generate an instance from JSON
  factory ProfitableTradeModel.fromJson(MapEntry<String, dynamic> item) =>
      ProfitableTradeModel(
        time: item.key,
        profit: item.value,
      );

  /// profit
  final double? profit;

  /// time year or month
  final String? time;

  /// Generate a copy of instance with given parameters
  ProfitableTradeModel copyWith({
    double? profit,
    String? time,
  }) =>
      ProfitableTradeModel(
        profit: profit ?? this.profit,
        time: time ?? this.time,
      );
}
