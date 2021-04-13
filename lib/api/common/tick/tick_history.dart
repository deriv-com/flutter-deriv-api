import 'package:flutter_deriv_api/api/common/models/candle_model.dart';
import 'package:flutter_deriv_api/api/common/models/history_model.dart';
import 'package:flutter_deriv_api/api/common/models/tick_history_model.dart';
import 'package:flutter_deriv_api/api/common/tick/exceptions/tick_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/manually/ohlc_receive.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import 'ohlc.dart';
import 'tick.dart';
import 'tick_base.dart';
import 'tick_history_subscription.dart';

/// Historic tick data for a given symbol.
class TickHistory extends TickHistoryModel {
  /// Initializes
  TickHistory({
    List<CandleModel?>? candles,
    HistoryModel? history,
    int? pipSize,
    this.subscriptionInformation,
  }) : super(
          candles,
          history,
          pipSize,
        );

  /// Generates an instance from [TicksHistoryResponse] object
  factory TickHistory.fromResponse(TicksHistoryResponse response) =>
      TickHistory(
        candles: getListFromMap(
          response.candles,
          itemToTypeCallback: (dynamic item) => CandleModel.fromJson(item),
        ),
        history: getItemFromMap(
          response.history,
          itemToTypeCallback: (dynamic item) => HistoryModel.fromJson(item),
        ),
        pipSize: response.pipSize as int?,
        subscriptionInformation:
            SubscriptionModel.fromJson(response.subscription),
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Subscription information
  final SubscriptionModel? subscriptionInformation;

  /// Gets the [TickHistory] for the given [symbol] in [request]
  ///
  /// Throws a [TickException] if API response contains an error
  static Future<TickHistory> fetchTickHistory(
    TicksHistoryRequest request,
  ) async {
    final TicksHistoryResponse response = await _api!.call<TicksHistoryResponse>(request: request);
    
    _checkException(response);

      return TickHistory.fromResponse(response);
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
      final Stream<Response> responseStream = _api!
          .subscribe(request: request, comparePredicate: comparePredicate)!;
      final Response firstResponse = await responseStream.first;

      _checkException(firstResponse);

      if (firstResponse is TicksHistoryResponse) {
        return TickHistorySubscription(
          tickHistory: TickHistory.fromResponse(firstResponse),
          tickStream: responseStream.map<TickBase?>(
            (Response response) {
              _checkException(response);

              return response is TicksResponse
                  ? Tick.fromJson(
                      response.tick,
                      subscriptionJson: response.subscription,
                    )
                  : response is OHLCResponse
                      ? OHLC.fromJson(
                          response.ohlc,
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

  static void _checkException(Response response) => checkException(
        response: response,
        exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
            TickException(baseExceptionModel: baseExceptionModel),
      );

  /// Generate a copy of instance with given parameters
  TickHistory copyWith({
    List<CandleModel>? candles,
    HistoryModel? history,
    int? pipSize,
  }) =>
      TickHistory(
        candles: candles ?? this.candles,
        history: history ?? this.history,
        pipSize: pipSize ?? this.pipSize,
      );
}
