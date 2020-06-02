import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/tick_exception.dart';
import 'tick_base.dart';

/// Normal tick class, represents price of the symbol in a time
class Tick extends TickBase {
  /// Initializes
  Tick({
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
  factory Tick.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      Tick(
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

  /// Unsubscribes all ticks.
  ///
  /// Throws a [TickException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllTicks() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.ticks);

    checkException(
      response: response,
      exceptionCreator: (String message) => TickException(message: message),
    );

    return ForgetAll.fromResponse(response);
  }
}
