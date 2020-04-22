import 'package:flutter_deriv_api/api/models/candle_model.dart';
import 'package:flutter_deriv_api/api/models/history_model.dart';
import 'package:flutter_deriv_api/api/models/tick_history_model.dart';

/// historic tick data for a given symbol.
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

  /// From JSON
  factory TickHistory.fromJson(Map<String, dynamic> json) => TickHistory(
        candles: json['candles'] != null
            ? json['candles']
                .map<CandleModel>((dynamic entry) => CandleModel.fromJson(entry))
                ?.toList()
            : null,
        history:
            json['history'] != null ? HistoryModel.fromJson(json['history']) : null,
        pipSize: json['pip_size'],
      );

  // TODO(ramin): Call for real API when its ready
  /// Gets TickHistory for the given [symbol]
  static Future<TickHistory> getTickHistory(
    String symbol, {
    int adjustStartTime,
    int count,
    String end,
    int granularity,
    int start,
    String style,
  }) async =>
      null;

  /// Clone a new instance
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
