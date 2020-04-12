/// generated automatically from flutter_deriv_api|lib/api/trading_durations_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'trading_durations_send.g.dart';

/// JSON conversion for 'trading_durations_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TradingDurationsRequest extends Request {
  /// Initialize TradingDurationsRequest
  TradingDurationsRequest({
    this.landingCompany,
    this.tradingDurations = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory TradingDurationsRequest.fromJson(Map<String, dynamic> json) =>
      _$TradingDurationsRequestFromJson(json);

  // Properties
  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String landingCompany;

  /// Must be `1`
  final int tradingDurations;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TradingDurationsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TradingDurationsRequest copyWith({
    String landingCompany,
    int tradingDurations,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      TradingDurationsRequest(
        landingCompany: landingCompany ?? this.landingCompany,
        tradingDurations: tradingDurations ?? this.tradingDurations,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
