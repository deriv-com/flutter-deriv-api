import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'tick.dart';

/// Normal tick class, represents price of the symbol in a time
class NormalTick extends Tick {
  ///
  NormalTick({
    this.ask,
    this.bid,
    this.quote,
    DateTime epoch,
    String id,
    int pipSize,
    String symbol,
    SubscriptionModel subscriptionInformation,
  }) : super(
          epoch: epoch,
          id: id,
          pipSize: pipSize,
          symbol: symbol,
          subscriptionInformation: subscriptionInformation,
        );

  /// Generates an instance from JSON
  factory NormalTick.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      NormalTick(
        ask: json['ask'],
        bid: json['bid'],
        quote: json['quote'],
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipSize: json['pip_size'],
        symbol: json['symbol'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Market ask at the epoch
  final double ask;

  /// Market bid at the epoch
  final double bid;

  /// Market value at the epoch
  final double quote;
}
