import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Historic tick data
class HistoryModel extends APIBaseModel {
  /// Initializes
  HistoryModel({this.prices, this.times});

  /// Generate an instance from json
  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        prices: getListFromMap(
          json['prices'],
          itemToTypeCallback: (dynamic item) => item.toDouble(),
        ),
        times: getListFromMap(
          json['times'],
          itemToTypeCallback: (dynamic item) => getDateTime(item),
        ),
      );

  /// Containing list of tick values for the
  /// corresponding epoch values in `times` array.
  final List<double> prices;

  /// Containing list of epoch values for the
  /// corresponding tick values in `prices` array.
  final List<DateTime> times;

  /// Generate a copy of instance with given parameters
  HistoryModel copyWith({
    List<double> prices,
    List<DateTime> times,
  }) =>
      HistoryModel(
        prices: prices ?? this.prices,
        times: times ?? this.times,
      );
}
