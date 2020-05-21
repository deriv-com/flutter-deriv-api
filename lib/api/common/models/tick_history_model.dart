import 'package:flutter_deriv_api/api/common/models/candle_model.dart';
import 'package:flutter_deriv_api/api/common/models/history_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Abstract class for TickHistory
abstract class TickHistoryModel extends APIBaseModel {
  /// Initializes
  TickHistoryModel(
    this.candles,
    this.history,
    this.pipSize,
  );

  /// Array of OHLC (open/high/low/close) price values for the given time.
  /// (only for style=`candles`)
  final List<CandleModel> candles;

  /// Historic tick data for a given symbol. Note: this will always return the
  /// latest possible set of ticks with accordance to the parameters specified.
  final HistoryModel history;

  /// Indicates the number of decimal points that
  /// the returned amounts must be displayed with
  final int pipSize;
}
