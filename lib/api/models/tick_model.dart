import 'base_model.dart';

/// Spot price updates for a given symbol
abstract class TickModel extends BaseModel {
  /// Initializes
  TickModel({
    this.ask,
    this.bid,
    this.epoch,
    this.id,
    this.pipSize,
    this.quote,
    this.symbol,
  });

  /// Market ask at the epoch
  final double ask;

  /// Market bid at the epoch
  final double bid;

  /// Epoch time of the tick
  final DateTime epoch;

  /// A stream ID that can be used to cancel this stream using
  /// the Forget request
  final String id;

  /// Indicates the number of decimal points that
  /// the returned amounts must be displayed with
  final int pipSize;

  /// Market value at the epoch
  final double quote;

  /// Symbol
  final String symbol;
}
