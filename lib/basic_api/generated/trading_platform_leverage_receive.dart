/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_leverage_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform leverage receive class.
class TradingPlatformLeverageReceive extends Response {
  /// Initialize TradingPlatformLeverageReceive.
  const TradingPlatformLeverageReceive({
    this.tradingPlatformLeverage,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformLeverageReceive.fromJson(Map<String, dynamic> json) =>
      TradingPlatformLeverageReceive(
        tradingPlatformLeverage:
            json['trading_platform_leverage'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Information for dynamic leverage for the requested trading platform
  final Map<String, dynamic>? tradingPlatformLeverage;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_leverage': tradingPlatformLeverage,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformLeverageReceive copyWith({
    Map<String, dynamic>? tradingPlatformLeverage,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformLeverageReceive(
        tradingPlatformLeverage:
            tradingPlatformLeverage ?? this.tradingPlatformLeverage,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
