import 'package:meta/meta.dart';

import '../../basic_api/generated/forget_all_receive.dart';
import '../../basic_api/generated/ticks_receive.dart';
import '../../basic_api/generated/ticks_send.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import '../models/enums.dart';
import 'forget_all_receive_result.dart';

/// Ticks response model class
abstract class TicksResponseModel {
  /// Initializes
  TicksResponseModel({
    @required this.subscription,
    @required this.tick,
  });

  /// For subscription requests only.
  final Subscription subscription;

  /// Tick by tick list of streamed data
  final Tick tick;
}

/// Ticks response class
class TicksResponse extends TicksResponseModel {
  /// Initializes
  TicksResponse({
    @required Tick tick,
    @required Subscription subscription,
  }) : super(
          tick: tick,
          subscription: subscription,
        );

  /// Creates an instance from JSON
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

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tick != null) {
      resultMap['tick'] = tick.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Subscribes to a tick for given [TickRequest]
  ///
  /// Throws [TickException] if API response contains an error
  static Stream<TicksResponse> subscribeTick(
    TicksSend tickRequest, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: tickRequest, comparePredicate: comparePredicate)
          .map<TicksResponse>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
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
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          TickException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters
  TicksResponse copyWith({
    Tick tick,
    Subscription subscription,
  }) =>
      TicksResponse(
        tick: tick ?? this.tick,
        subscription: subscription ?? this.subscription,
      );
}
/// Tick model class
abstract class TickModel {
  /// Initializes
  TickModel({
    @required this.symbol,
    @required this.quote,
    @required this.pipSize,
    @required this.id,
    @required this.epoch,
    @required this.bid,
    @required this.ask,
  });

  /// Symbol
  final String symbol;

  /// Market value at the epoch
  final double quote;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final double pipSize;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Epoch time of the tick
  final DateTime epoch;

  /// Market bid at the epoch
  final double bid;

  /// Market ask at the epoch
  final double ask;
}

/// Tick class
class Tick extends TickModel {
  /// Initializes
  Tick({
    @required double ask,
    @required double bid,
    @required DateTime epoch,
    @required String id,
    @required double pipSize,
    @required double quote,
    @required String symbol,
  }) : super(
          ask: ask,
          bid: bid,
          epoch: epoch,
          id: id,
          pipSize: pipSize,
          quote: quote,
          symbol: symbol,
        );

  /// Creates an instance from JSON
  factory Tick.fromJson(Map<String, dynamic> json) => Tick(
        ask: getDouble(json['ask']),
        bid: getDouble(json['bid']),
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipSize: getDouble(json['pip_size']),
        quote: getDouble(json['quote']),
        symbol: json['symbol'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask'] = ask;
    resultMap['bid'] = bid;
    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['id'] = id;
    resultMap['pip_size'] = pipSize;
    resultMap['quote'] = quote;
    resultMap['symbol'] = symbol;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Tick copyWith({
    double ask,
    double bid,
    DateTime epoch,
    String id,
    double pipSize,
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
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
