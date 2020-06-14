import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Spot price updates for a given symbol
abstract class TickBaseModel extends APIBaseModel {
  /// Initializes
  TickBaseModel({
    this.epoch,
    this.id,
    this.pipSize,
    this.symbol,
  });

  /// Epoch time of the tick
  final DateTime epoch;

  /// A stream ID that can be used to cancel this stream using
  /// the Forget request
  final String id;

  /// Indicates the number of decimal points that
  /// the returned amounts must be displayed with
  final int pipSize;

  /// Symbol
  final String symbol;
}
