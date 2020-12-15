import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trade time class
class TradeTimesModel extends APIBaseModel {
  /// Initializes
  TradeTimesModel({
    this.close,
    this.open,
    this.settlement,
  });

  /// Creates an instance from JSON
  factory TradeTimesModel.fromJson(Map<String, dynamic> json) =>
      TradeTimesModel(
        open: getListFromMap(json['open']),
        close: getListFromMap(json['close']),
        settlement: json['settlement'],
      );

  /// Close time
  final List<String> close;

  /// Open time
  final List<String> open;

  /// Settlement time
  final String settlement;

  /// Creates a copy of instance with given parameters
  TradeTimesModel copyWith({
    List<String> close,
    List<String> open,
    String settlement,
  }) =>
      TradeTimesModel(
        close: close ?? this.close,
        open: open ?? this.open,
        settlement: settlement ?? this.settlement,
      );
}
