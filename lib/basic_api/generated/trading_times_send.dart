/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_times_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading times request class.
class TradingTimesRequest extends Request {
  /// Initialize TradingTimesRequest.
  const TradingTimesRequest({
    required this.tradingTimes,
    super.msgType = 'trading_times',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingTimesRequest.fromJson(Map<String, dynamic> json) =>
      TradingTimesRequest(
        tradingTimes: json['trading_times'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Date to receive market opening times for. (`yyyy-mm-dd` format. `today` can also be specified).
  final String? tradingTimes;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_times': tradingTimes,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingTimesRequest copyWith({
    String? tradingTimes,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingTimesRequest(
        tradingTimes: tradingTimes ?? this.tradingTimes,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
