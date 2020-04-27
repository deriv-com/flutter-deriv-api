
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// price values for the given time (only for style=`candles`)
class CandleModel extends BaseModel {
  /// Initializes
  CandleModel({
    this.close,
    this.epoch,
    this.high,
    this.low,
    this.open,
  });

  /// From JSON
  factory CandleModel.fromJson(Map<String, dynamic> json) => CandleModel(
        close: json['close'],
        epoch: json['epoch'] == null ? null : getDateTime(json['epoch']),
        high: json['high'],
        low: json['low'],
        open: json['open'],
      );

  /// It is the close price value for the given time
  final double close;

  /// It is an epoch value
  final DateTime epoch;

  /// It is the high price value for the given time
  final double high;

  /// It is the low price value for the given time
  final double low;

  /// It is the open price value for the given time
  final double open;

  /// Clone a new instance
  CandleModel copyWith({
    double close,
    int epoch,
    double high,
    double low,
    double open,
  }) =>
      CandleModel(
        close: close ?? this.close,
        epoch: epoch ?? this.epoch,
        high: high ?? this.high,
        low: low ?? this.low,
        open: open ?? this.open,
      );
}
