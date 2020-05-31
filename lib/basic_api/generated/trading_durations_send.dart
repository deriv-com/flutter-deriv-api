/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_durations_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'trading_durations_send.g.dart';

/// JSON conversion for 'trading_durations_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class TradingDurationsRequest extends Request {
  /// Initialize TradingDurationsRequest
  const TradingDurationsRequest({
    this.landingCompany,
    this.tradingDurations = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'trading_durations',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TradingDurationsRequest.fromJson(Map<String, dynamic> json) =>
      _$TradingDurationsRequestFromJson(json);

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String landingCompany;

  /// Must be `1`
  final int tradingDurations;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TradingDurationsRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TradingDurationsRequest copyWith({
    String landingCompany,
    int tradingDurations,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TradingDurationsRequest(
        landingCompany: landingCompany ?? this.landingCompany,
        tradingDurations: tradingDurations ?? this.tradingDurations,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
