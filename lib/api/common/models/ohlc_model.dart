import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// OHLC model class
abstract class OHLCModel extends APIBaseModel {
  /// Initializes
  OHLCModel({
    this.close,
    this.epoch,
    this.granularity,
    this.high,
    this.id,
    this.low,
    this.open,
    this.openTime,
    this.pipeSize,
    this.symbol,
  });

  /// Close
  final String close;

  /// Epoch
  final DateTime epoch;

  /// Granularity
  final int granularity;

  /// High
  final String high;

  /// id
  final String id;

  /// Low
  final String low;

  /// Open
  final String open;

  /// Open time
  final DateTime openTime;

  /// Pipe size
  final double pipeSize;

  /// Symbol
  final String symbol;
}
