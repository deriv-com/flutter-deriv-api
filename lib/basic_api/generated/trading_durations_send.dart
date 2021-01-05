/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_durations_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Trading durations send class
class TradingDurationsSend extends Request {
  /// Initialize TradingDurationsSend
  const TradingDurationsSend({
    this.landingCompany,
    this.tradingDurations = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'trading_durations',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TradingDurationsSend.fromJson(Map<String, dynamic> json) =>
      TradingDurationsSend(
        landingCompany: json['landing_company'] as String,
        tradingDurations: json['trading_durations'] == null
            ? null
            : json['trading_durations'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String landingCompany;

  /// Must be `true`
  final bool tradingDurations;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'landing_company': landingCompany,
        'trading_durations': tradingDurations == null
            ? null
            : tradingDurations
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingDurationsSend copyWith({
    String landingCompany,
    bool tradingDurations,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TradingDurationsSend(
        landingCompany: landingCompany ?? this.landingCompany,
        tradingDurations: tradingDurations ?? this.tradingDurations,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
