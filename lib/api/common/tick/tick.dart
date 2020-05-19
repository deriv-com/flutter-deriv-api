import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/common/models/tick_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
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

  /// Generates an instance from JSON
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

  /// Subscribes to a tick for given [TickRequest]
  ///
  /// Throws [TickException] if API response contains an error
  static Stream<Tick> subscribeTick(
    TicksRequest tickRequest, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: tickRequest, comparePredicate: comparePredicate)
          .map<Tick>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: (String message) =>
                TickException(message: message),
          );

          return response is TicksResponse
              ? Tick.fromJson(
                  response.tick,
                  subscriptionJson: response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from tick stream
  Future<Forget> unsubscribeTick() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: (String message) => TickException(message: message),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all ticks.
  static Future<ForgetAll> unsubscribeAllTicks() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.ticks);

    checkException(
      response: response,
      exceptionCreator: (String message) => TickException(message: message),
    );

    return ForgetAll.fromResponse(response);
  }

  /// Generates a copy of instance with given parameters
  Tick copyWith({
    double ask,
    double bid,
    DateTime epoch,
    String id,
    int pipSize,
    double quote,
    String symbol,
    SubscriptionModel subscriptionInformation,
  }) =>
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
