import 'base_model.dart';
import 'candle_model.dart';
import 'history_model.dart';

/// Abstract class for TickHistory
abstract class TickHistoryModel extends BaseModel {
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
