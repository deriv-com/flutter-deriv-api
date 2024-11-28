// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Ticks batch response model class.
abstract class TicksBatchResponseModel {
  /// Initializes Ticks batch response model class .
  const TicksBatchResponseModel({
    this.ticksBatch,
    this.subscription,
  });

  /// Tick by tick list of streamed data for a group of symbols
  final List<TicksBatchItem>? ticksBatch;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Ticks batch response class.
class TicksBatchResponse extends TicksBatchResponseModel {
  /// Initializes Ticks batch response class.
  const TicksBatchResponse({
    super.ticksBatch,
    super.subscription,
  });

  /// Creates an instance from JSON.
  factory TicksBatchResponse.fromJson(
    dynamic ticksBatchJson,
    dynamic subscriptionJson,
  ) =>
      TicksBatchResponse(
        ticksBatch: ticksBatchJson == null
            ? null
            : List<TicksBatchItem>.from(
                ticksBatchJson?.map(
                  (dynamic item) => TicksBatchItem.fromJson(item),
                ),
              ),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (ticksBatch != null) {
      resultMap['ticks_batch'] = ticksBatch!
          .map<dynamic>(
            (TicksBatchItem item) => item.toJson(),
          )
          .toList();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TicksBatchResponse copyWith({
    List<TicksBatchItem>? ticksBatch,
    Subscription? subscription,
  }) =>
      TicksBatchResponse(
        ticksBatch: ticksBatch ?? this.ticksBatch,
        subscription: subscription ?? this.subscription,
      );
}
/// Ticks batch item model class.
abstract class TicksBatchItemModel {
  /// Initializes Ticks batch item model class .
  const TicksBatchItemModel({
    required this.symbol,
    required this.quote,
    required this.epoch,
    required this.change,
    required this.bid,
    required this.ask,
  });

  /// Symbol
  final String symbol;

  /// Market value at the epoch
  final String quote;

  /// Epoch time of the tick
  final DateTime epoch;

  /// Daily percentage change
  final String change;

  /// Market bid at the epoch
  final String bid;

  /// Market ask at the epoch
  final String ask;
}

/// Ticks batch item class.
class TicksBatchItem extends TicksBatchItemModel {
  /// Initializes Ticks batch item class.
  const TicksBatchItem({
    required super.ask,
    required super.bid,
    required super.change,
    required super.epoch,
    required super.quote,
    required super.symbol,
  });

  /// Creates an instance from JSON.
  factory TicksBatchItem.fromJson(Map<String, dynamic> json) => TicksBatchItem(
        ask: json['ask'],
        bid: json['bid'],
        change: json['change'],
        epoch: getDateTime(json['epoch'])!,
        quote: json['quote'],
        symbol: json['symbol'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask'] = ask;
    resultMap['bid'] = bid;
    resultMap['change'] = change;
    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['quote'] = quote;
    resultMap['symbol'] = symbol;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TicksBatchItem copyWith({
    String? ask,
    String? bid,
    String? change,
    DateTime? epoch,
    String? quote,
    String? symbol,
  }) =>
      TicksBatchItem(
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        change: change ?? this.change,
        epoch: epoch ?? this.epoch,
        quote: quote ?? this.quote,
        symbol: symbol ?? this.symbol,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required super.id,
  });

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
