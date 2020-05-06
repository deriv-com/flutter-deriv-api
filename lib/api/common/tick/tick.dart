import 'package:flutter_deriv_api/api/common/models/tick_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Spot price updates for a given symbol
class Tick extends TickModel {
  /// Initializes
  Tick({
    double ask,
    double bid,
    DateTime epoch,
    String id,
    int pipSize,
    double quote,
    String symbol,
  }) : super(
          ask: ask,
          bid: bid,
          epoch: epoch,
          id: id,
          pipSize: pipSize,
          quote: quote,
          symbol: symbol,
        );

  /// Generate an instance from JSON
  factory Tick.fromJson(Map<String, dynamic> json) => Tick(
        ask: json['ask'],
        bid: json['bid'],
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipSize: json['pip_size'],
        quote: json['quote'],
        symbol: json['symbol'],
      );

  /// Generate a copy of instance with given parameters
  Tick copyWith({
    double ask,
    double bid,
    DateTime epoch,
    String id,
    int pipSize,
    double quote,
    String symbol,
  }) =>
      Tick(
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        epoch: epoch ?? this.epoch,
        id: id ?? this.id,
        pipSize: pipSize ?? this.pipSize,
        quote: quote ?? this.quote,
        symbol: symbol ?? this.symbol,
      );
}
