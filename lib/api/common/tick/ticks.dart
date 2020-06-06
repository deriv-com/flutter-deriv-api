import 'package:flutter_deriv_api/api/common/tick/exceptions/tick_exception.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_api/api/common/tick/ohlc.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/manually/ohlc_receive.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'tick_base.dart';
import 'tick_history.dart';

/// Consist of Stream of [TickBase] and its history as [TickHistory]
class Ticks {
  /// Initializes
  Ticks({this.tickHistory, this.tickStream});

  /// The history of tick
  TickHistory tickHistory;

  /// The stream of the tick
  final Stream<TickBase> tickStream;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets ticks history and its stream
  ///
  /// Throws [TickException] if API response contains an error
  static Future<Ticks> fetchTicksWithHistory(
    TicksHistoryRequest request, {
    bool subscribe = false,
  }) async {
    if (subscribe) {
      final Stream<Response> responseStream = _api.subscribe(request: request);
      final Response firstResponse = await responseStream.first;

      _checkException(firstResponse);

      if (firstResponse is TicksHistoryResponse) {
        return Ticks(
          tickHistory: TickHistory.fromResponse(firstResponse),
          tickStream: responseStream.map<TickBase>(
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
      final TicksHistoryResponse response = await _api.call(request: request);

      _checkException(response);

      return Ticks(tickHistory: TickHistory.fromResponse(response));
    }
  }

  static void _checkException(Response response) => checkException(
        response: response,
        exceptionCreator: (String message) => TickException(message: message),
      );
}