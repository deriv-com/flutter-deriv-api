// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/manually/ohlc_response.dart';
import 'package:flutter_deriv_api/api/manually/ohlc_response_result.dart';
import 'package:flutter_deriv_api/api/manually/tick.dart';
import 'package:flutter_deriv_api/api/manually/tick_base.dart';
import 'package:flutter_deriv_api/api/manually/tick_history_subscription.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_history_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_history_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_receive.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Ticks history response model class.
abstract class TicksHistoryResponseModel extends Equatable {
  /// Initializes Ticks history response model class .
  const TicksHistoryResponseModel({
    this.candles,
    this.history,
    this.pipSize,
    this.subscription,
  });

  /// Array of OHLC (open/high/low/close) price values for the given time (only for style=`candles`)
  final List<CandlesItem>? candles;

  /// Historic tick data for a given symbol. Note: this will always return the latest possible set of ticks with accordance to the parameters specified.
  final History? history;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final double? pipSize;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Ticks history response class.
class TicksHistoryResponse extends TicksHistoryResponseModel {
  /// Initializes Ticks history response class.
  const TicksHistoryResponse({
    List<CandlesItem>? candles,
    History? history,
    double? pipSize,
    Subscription? subscription,
  }) : super(
          candles: candles,
          history: history,
          pipSize: pipSize,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory TicksHistoryResponse.fromJson(
    dynamic candlesJson,
    dynamic historyJson,
    dynamic pipSizeJson,
    dynamic subscriptionJson,
  ) =>
      TicksHistoryResponse(
        candles: candlesJson == null
            ? null
            : List<CandlesItem>.from(
                candlesJson?.map(
                  (dynamic item) => CandlesItem.fromJson(item),
                ),
              ),
        history: historyJson == null ? null : History.fromJson(historyJson),
        pipSize: getDouble(pipSizeJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (candles != null) {
      resultMap['candles'] = candles!
          .map<dynamic>(
            (CandlesItem item) => item.toJson(),
          )
          .toList();
    }
    if (history != null) {
      resultMap['history'] = history!.toJson();
    }
    resultMap['pip_size'] = pipSize;
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the [TickHistory] for the given [symbol] in [request]
  ///
  /// Throws a [TickException] if API response contains an error
  static Future<TicksHistoryResponse> fetchTickHistory(
    TicksHistoryRequest request,
  ) async {
    final TicksHistoryReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TickException(baseExceptionModel: baseExceptionModel),
    );

    return TicksHistoryResponse.fromJson(response.candles, response.history,
        response.pipSize, response.subscription);
  }

  /// Gets ticks history and its stream
  ///
  /// Throws [TickException] if API response contains an error
  static Future<TickHistorySubscription?> fetchTicksAndSubscribe(
    TicksHistoryRequest request, {
    RequestCompareFunction? comparePredicate,
    bool subscribe = true,
  }) async {
    if (subscribe) {
      final Stream<Response>? responseStream =
          _api.subscribe(request: request, comparePredicate: comparePredicate);
      final Response? firstResponse = await responseStream?.first;

      checkException(
        response: firstResponse,
        exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
            TickException(baseExceptionModel: baseExceptionModel),
      );
      if (firstResponse is TicksHistoryReceive) {
        return TickHistorySubscription(
          tickHistory: TicksHistoryResponse.fromJson(
              firstResponse.candles,
              firstResponse.history,
              firstResponse.pipSize,
              firstResponse.subscription),
          tickStream: responseStream?.map<TickBase?>(
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
                  : response is OHLCResponse
                      ? OHLC.fromJson(
                          response.ohlc!,
                          subscriptionJson: response.subscription,
                        )
                      : null;
            },
          ),
        );
      }
      return null;
    } else {
      return TickHistorySubscription(
        tickHistory: await fetchTickHistory(request),
      );
    }
  }

  /// Creates a copy of instance with given parameters.
  TicksHistoryResponse copyWith({
    List<CandlesItem>? candles,
    History? history,
    double? pipSize,
    Subscription? subscription,
  }) =>
      TicksHistoryResponse(
        candles: candles ?? this.candles,
        history: history ?? this.history,
        pipSize: pipSize ?? this.pipSize,
        subscription: subscription ?? this.subscription,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Candles item model class.
abstract class CandlesItemModel extends Equatable {
  /// Initializes Candles item model class .
  const CandlesItemModel({
    this.close,
    this.epoch,
    this.high,
    this.low,
    this.open,
  });

  /// It is the close price value for the given time
  final double? close;

  /// It is an epoch value
  final DateTime? epoch;

  /// It is the high price value for the given time
  final double? high;

  /// It is the low price value for the given time
  final double? low;

  /// It is the open price value for the given time
  final double? open;
}

/// Candles item class.
class CandlesItem extends CandlesItemModel {
  /// Initializes Candles item class.
  const CandlesItem({
    double? close,
    DateTime? epoch,
    double? high,
    double? low,
    double? open,
  }) : super(
          close: close,
          epoch: epoch,
          high: high,
          low: low,
          open: open,
        );

  /// Creates an instance from JSON.
  factory CandlesItem.fromJson(Map<String, dynamic> json) => CandlesItem(
        close: getDouble(json['close']),
        epoch: getDateTime(json['epoch']),
        high: getDouble(json['high']),
        low: getDouble(json['low']),
        open: getDouble(json['open']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['close'] = close;
    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['high'] = high;
    resultMap['low'] = low;
    resultMap['open'] = open;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CandlesItem copyWith({
    double? close,
    DateTime? epoch,
    double? high,
    double? low,
    double? open,
  }) =>
      CandlesItem(
        close: close ?? this.close,
        epoch: epoch ?? this.epoch,
        high: high ?? this.high,
        low: low ?? this.low,
        open: open ?? this.open,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// History model class.
abstract class HistoryModel extends Equatable {
  /// Initializes History model class .
  const HistoryModel({
    this.prices,
    this.times,
  });

  /// An array containing list of tick values for the corresponding epoch values in `times` array.
  final List<double>? prices;

  /// An array containing list of epoch values for the corresponding tick values in `prices` array.
  final List<DateTime>? times;
}

/// History class.
class History extends HistoryModel {
  /// Initializes History class.
  const History({
    List<double>? prices,
    List<DateTime>? times,
  }) : super(
          prices: prices,
          times: times,
        );

  /// Creates an instance from JSON.
  factory History.fromJson(Map<String, dynamic> json) => History(
        prices: json['prices'] == null
            ? null
            : List<double>.from(
                json['prices']?.map(
                  (dynamic item) => getDouble(item),
                ),
              ),
        times: json['times'] == null
            ? null
            : List<DateTime>.from(
                json['times']?.map(
                  (dynamic item) => getDateTime(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (prices != null) {
      resultMap['prices'] = prices!
          .map<dynamic>(
            (double item) => item,
          )
          .toList();
    }
    if (times != null) {
      resultMap['times'] = times!
          .map<dynamic>(
            (DateTime item) => getSecondsSinceEpochDateTime(item),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  History copyWith({
    List<double>? prices,
    List<DateTime>? times,
  }) =>
      History(
        prices: prices ?? this.prices,
        times: times ?? this.times,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
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
  List<Object?> get props => <Object?>[];
}
