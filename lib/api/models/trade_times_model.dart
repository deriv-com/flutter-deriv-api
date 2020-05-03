import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Trade time class
class TradeTimesModel extends BaseModel {
  /// Initializes
  TradeTimesModel({
    this.close,
    this.open,
    this.settlement,
  });

  /// Creates instance from json
  factory TradeTimesModel.fromJson(Map<String, dynamic> json) =>
      TradeTimesModel(
        open: getListFromMap(json['close']),
        close: getListFromMap(json['open']),
        settlement: json['settlement'],
      );

  /// Close time
  final List<String> close;

  /// Open time
  final List<String> open;

  /// Settlement time
  final String settlement;

  /// Creates copy of instance with given parameters
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
