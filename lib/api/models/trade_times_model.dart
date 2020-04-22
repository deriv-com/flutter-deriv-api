import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Trade time class
class TradeTimesModel extends BaseModel {
  /// Class constructor
  TradeTimesModel({
    this.close,
    this.open,
    this.settlement,
  });

  /// Creates instance from json
  factory TradeTimesModel.fromJson(Map<String, dynamic> json) =>
      TradeTimesModel(
        open: json['close'] == null
            ? null
            : json['close']
                .map<String>((dynamic item) => item.toString())
                .toList(),
        close: json['open'] == null
            ? null
            : json['open']
                .map<String>((dynamic item) => item.toString())
                .toList(),
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
