import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/models/tick_model.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/tick_exception.dart';

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
    this.subscriptionInformation,
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
  factory Tick.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      Tick(
        ask: json['ask'],
        bid: json['bid'],
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipSize: json['pip_size'],
        quote: json['quote'],
        symbol: json['symbol'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Subscription information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Subscribes to tick request for given [TickRequest]
  static Stream<Tick> subscribeTick(
    TicksRequest tickRequest, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(
        request: tickRequest,
        comparePredicate: comparePredicate,
      )
          .map<Tick>((Response response) {
        if (response.error != null) {
          throw TickException(message: response.error['message']);
        }
        final TicksResponse ticksResponse = response;
        return Tick.fromJson(
          ticksResponse.tick,
          subscriptionJson: ticksResponse.subscription,
        );
      });

  // TODO(ramin): Add implementation when unsubscribe method is available in [BaseAPI]
  /// Unsubscribes from tick stream
  Future<Forget> unsubscribe() async => null;

  /// Generates a copy of instance with given parameters
  Tick copyWith(
          {double ask,
          double bid,
          DateTime epoch,
          String id,
          int pipSize,
          double quote,
          String symbol,
          SubscriptionModel subscriptionInformation}) =>
      Tick(
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        epoch: epoch ?? this.epoch,
        id: id ?? this.id,
        pipSize: pipSize ?? this.pipSize,
        quote: quote ?? this.quote,
        symbol: symbol ?? this.symbol,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
