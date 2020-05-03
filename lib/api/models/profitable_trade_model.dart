import 'base_model.dart';

/// Represents the net change in equity per [time]
class ProfitableTradeModel extends BaseModel {
  /// Initializes
  ProfitableTradeModel({this.profit, this.time});

  /// From JSON
  factory ProfitableTradeModel.fromJson(MapEntry<String, dynamic> entry) =>
      ProfitableTradeModel(
        time: entry.key,
        profit: entry.value,
      );

  /// profit
  final double profit;

  /// time year or month
  final String time;

  /// Clones a new instance
  ProfitableTradeModel copyWith({
    double profit,
    String time,
  }) =>
      ProfitableTradeModel(
        profit: profit ?? this.profit,
        time: time ?? this.time,
      );
}
