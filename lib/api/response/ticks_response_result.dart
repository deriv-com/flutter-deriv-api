// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Ticks response model class.
abstract class TicksResponseModel extends Equatable {
  /// Initializes Ticks response model class .
  const TicksResponseModel({
    this.tick,
    this.subscription,
  });

  /// Tick by tick list of streamed data
  final Tick? tick;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Ticks response class.
class TicksResponse extends TicksResponseModel {
  /// Initializes Ticks response class.
  const TicksResponse({
    Tick? tick,
    Subscription? subscription,
  }) : super(
          tick: tick,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory TicksResponse.fromJson(
    dynamic tickJson,
    dynamic subscriptionJson,
  ) =>
      TicksResponse(
        tick: tickJson == null ? null : Tick.fromJson(tickJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tick != null) {
      resultMap['tick'] = tick!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Subscribes to a tick for given [TickRequest]
  ///
  /// Throws [TickException] if API response contains an error
  static Stream<TicksResponse?> subscribeTick(
    TicksRequest tickRequest, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: tickRequest, comparePredicate: comparePredicate)!
          .map<TicksResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                TickException(baseExceptionModel: baseExceptionModel),
          );

          return response is TicksReceive
              ? TicksResponse.fromJson(
                  response.tick,
                  response.subscription,
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

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters.
  TicksResponse copyWith({
    Tick? tick,
    Subscription? subscription,
  }) =>
      TicksResponse(
        tick: tick ?? this.tick,
        subscription: subscription ?? this.subscription,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
/// Tick model class.
abstract class TickModel extends Equatable {
  /// Initializes Tick model class .
  const TickModel({
    required this.pipSize,
    this.ask,
    this.bid,
    this.epoch,
    this.id,
    this.quote,
    this.symbol,
  });

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final double pipSize;

  /// Market ask at the epoch
  final double? ask;

  /// Market bid at the epoch
  final double? bid;

  /// Epoch time of the tick
  final DateTime? epoch;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String? id;

  /// Market value at the epoch
  final double? quote;

  /// Symbol
  final String? symbol;
}

/// Tick class.
class Tick extends TickModel {
  /// Initializes Tick class.
  const Tick({
    required double pipSize,
    double? ask,
    double? bid,
    DateTime? epoch,
    String? id,
    double? quote,
    String? symbol,
  }) : super(
          pipSize: pipSize,
          ask: ask,
          bid: bid,
          epoch: epoch,
          id: id,
          quote: quote,
          symbol: symbol,
        );

  /// Creates an instance from JSON.
  factory Tick.fromJson(Map<String, dynamic> json) => Tick(
        pipSize: getDouble(json['pip_size'])!,
        ask: getDouble(json['ask']),
        bid: getDouble(json['bid']),
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        quote: getDouble(json['quote']),
        symbol: json['symbol'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['pip_size'] = pipSize;
    resultMap['ask'] = ask;
    resultMap['bid'] = bid;
    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['id'] = id;
    resultMap['quote'] = quote;
    resultMap['symbol'] = symbol;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Tick copyWith({
    required double pipSize,
    double? ask,
    double? bid,
    DateTime? epoch,
    String? id,
    double? quote,
    String? symbol,
  }) =>
      Tick(
        pipSize: pipSize,
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        epoch: epoch ?? this.epoch,
        id: id ?? this.id,
        quote: quote ?? this.quote,
        symbol: symbol ?? this.symbol,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
/// Subscription model class.
abstract class SubscriptionModel extends Equatable {
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
    required String id,
  }) : super(
          id: id,
        );

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
    required String id,
  }) =>
      Subscription(
        id: id,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
