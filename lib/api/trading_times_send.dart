/// generated automatically from flutter_deriv_api|lib/api/trading_times_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'trading_times_send.g.dart';

/// JSON conversion for 'trading_times_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TradingTimesRequest extends Request {
  /// Initialize TradingTimesRequest
  const TradingTimesRequest({
    this.tradingTimes,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory TradingTimesRequest.fromJson(Map<String, dynamic> json) =>
      _$TradingTimesRequestFromJson(json);

  // Properties
  /// Date to receive market opening times for. (`yyyy-mm-dd` format. `today` can also be specified).
  final String tradingTimes;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TradingTimesRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TradingTimesRequest copyWith({
    String tradingTimes,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      TradingTimesRequest(
        tradingTimes: tradingTimes ?? this.tradingTimes,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
