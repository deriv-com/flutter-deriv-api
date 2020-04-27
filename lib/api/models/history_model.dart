import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// Historic tick data
class HistoryModel extends BaseModel {
  /// Initializes
  HistoryModel({this.prices, this.times});

  /// From JSON
  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        prices: json['prices'] == null
            ? null
            : json['prices'].map<double>((dynamic entry) {
                final double price = entry.toDouble();
                return price;
              })?.toList(),
        times: json['times'] == null
            ? null
            : json['times']
                .map<DateTime>((dynamic entry) => getDateTime(entry))
                ?.toList(),
      );

  /// Containing list of tick values for the
  /// corresponding epoch values in `times` array.
  final List<double> prices;

  /// Containing list of epoch values for the
  /// corresponding tick values in `prices` array.
  final List<DateTime> times;

  /// Clones a new instance
  HistoryModel copyWith({
    List<double> prices,
    List<DateTime> times,
  }) =>
      HistoryModel(
        prices: prices ?? this.prices,
        times: times ?? this.times,
      );
}
