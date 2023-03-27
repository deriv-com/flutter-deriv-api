import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

import 'tick_base.dart';

/// Normal tick class, represents price of the symbol in one unit of time
class Tick extends TickBase {
  /// Initializes
  Tick({
    this.ask,
    this.bid,
    this.quote,
    DateTime? epoch,
    String? id,
    int? pipSize,
    String? symbol,
    SubscriptionModel? subscriptionInformation,
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
    Map<String, dynamic>? subscriptionJson,
  }) =>
      Tick(
        ask: json['ask']?.toDouble(),
        bid: json['bid']?.toDouble(),
        quote: json['quote']?.toDouble(),
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipSize: json['pip_size'],
        symbol: json['symbol'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Market ask at the epoch
  final double? ask;

  /// Market bid at the epoch
  final double? bid;

  /// Market value at the epoch
  final double? quote;

  static final BaseAPI _api = Injector().get<BaseAPI>()!;

  /// Subscribes to a tick for given [TickRequest]
  ///
  /// Throws [TickException] if API response contains an error
  static Stream<Tick?> subscribeTick(
    TicksRequest tickRequest, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: tickRequest, comparePredicate: comparePredicate)!
          .map<Tick?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                TickException(baseExceptionModel: baseExceptionModel),
          );

          return response is TicksReceive
              ? Tick.fromJson(
                  response.tick!,
                  subscriptionJson: response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes all ticks.
  ///
  /// Throws a [TickException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllTicks() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.ticks);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TickException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response);
  }

  /// Creates a copy of instance with given parameters
  @override
  Tick copyWith({
    double? ask,
    double? bid,
    double? quote,
    DateTime? epoch,
    String? id,
    int? pipSize,
    String? symbol,
    SubscriptionModel? subscriptionInformation,
  }) =>
      Tick(
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        quote: quote ?? this.quote,
        epoch: epoch ?? this.epoch,
        id: id ?? this.id,
        pipSize: pipSize ?? this.pipSize,
        symbol: symbol ?? this.symbol,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
