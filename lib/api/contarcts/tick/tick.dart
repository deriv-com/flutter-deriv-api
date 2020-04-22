import 'package:flutter_deriv_api/api/models/tick_model.dart';

/// Spot price updates for a given symbol
class Tick extends TickModel {
  /// Initializes
  Tick({
    double ask,
    double bid,
    int epoch,
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

  /// From JSON
  factory Tick.fromJson(Map<String, dynamic> json) => Tick(
        ask: json['ask'],
        bid: json['bid'],
        epoch: json['epoch'],
        id: json['id'],
        pipSize: json['pip_size'],
        quote: json['quote'],
        symbol: json['symbol'],
      );

  /// Clone a new instance
  Tick copyWith({
    double ask,
    double bid,
    int epoch,
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

