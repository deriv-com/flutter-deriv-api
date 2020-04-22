import 'base_model.dart';

/// Historic tick data
class HistoryModel extends BaseModel {
  /// Initializes
  HistoryModel(this.prices, this.times);

  /// From JSON
  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        json['prices'].map<double>((dynamic entry) {
          final double price = entry.toDouble();
          return price;
        })?.toList(),
        json['times'].map<int>((dynamic entry) {
          final int time = entry;
          return time;
        })?.toList(),
      );

  /// Containing list of tick values for the
  /// corresponding epoch values in `times` array.
  final List<double> prices;

  /// Containing list of epoch values for the
  /// corresponding tick values in `prices` array.
  final List<int> times;

  /// Clones a new instance
  HistoryModel copyWith({
    List<double> prices,
    List<int> times,
  }) =>
      HistoryModel(
        prices ?? this.prices,
        times ?? this.times,
      );
}
