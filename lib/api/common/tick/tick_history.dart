import 'package:flutter_deriv_api/api/common/models/candle_model.dart';
import 'package:flutter_deriv_api/api/common/models/history_model.dart';
import 'package:flutter_deriv_api/api/common/models/tick_history_model.dart';
import 'package:flutter_deriv_api/api/common/tick/exceptions/tick_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Historic tick data for a given symbol.
class TickHistory extends TickHistoryModel {
  /// Initializes
  TickHistory({
    List<CandleModel> candles,
    HistoryModel history,
    int pipSize,
  }) : super(
          candles,
          history,
          pipSize,
        );

  /// Generates an instance from JSON
  factory TickHistory.fromJson(Map<String, dynamic> json) => TickHistory(
        candles: getListFromMap(
          json['candles'],
          itemToTypeCallback: (dynamic item) => CandleModel.fromJson(item),
        ),
        history: getItemFromMap(
          json['history'],
          itemToTypeCallback: (dynamic item) => HistoryModel.fromJson(item),
        ),
        pipSize: json['pip_size'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the [TickHistory] for the given [symbol] in [request]
  ///
  /// Throws a [TickException] if API response contains an error
  static Future<TickHistory> fetchTickHistory(
    TicksHistoryRequest request,
  ) async {
    final TicksHistoryResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) => TickException(message: message),
    );

    return TickHistory.fromJson(
      <String, dynamic>{
        'candles': response.candles,
        'history': response.history,
        'pip_size': response.pipSize,
      },
    );
  }

  /// Generate a copy of instance with given parameters
  TickHistory copyWith({
    List<CandleModel> candles,
    HistoryModel history,
    int pipSize,
  }) =>
      TickHistory(
        candles: candles ?? this.candles,
        history: history ?? this.history,
        pipSize: pipSize ?? this.pipSize,
      );
}
