/// generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_times_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'trading_times_send.g.dart';

/// JSON conversion for 'trading_times_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TradingTimesRequest extends Request {
  /// Initialize TradingTimesRequest
  const TradingTimesRequest({
    this.tradingTimes,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TradingTimesRequest(
        tradingTimes: tradingTimes ?? this.tradingTimes,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
