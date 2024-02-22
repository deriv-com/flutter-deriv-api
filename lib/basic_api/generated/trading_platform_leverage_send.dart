/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_leverage_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform leverage request class.
class TradingPlatformLeverageRequest extends Request {
  /// Initialize TradingPlatformLeverageRequest.
  const TradingPlatformLeverageRequest({
    required this.platform,
    this.tradingPlatformLeverage = true,
    super.msgType = 'trading_platform_leverage',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformLeverageRequest.fromJson(Map<String, dynamic> json) =>
      TradingPlatformLeverageRequest(
        platform: json['platform'] as String?,
        tradingPlatformLeverage: json['trading_platform_leverage'] == null
            ? null
            : json['trading_platform_leverage'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Name of trading platform.
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformLeverage;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'trading_platform_leverage': tradingPlatformLeverage == null
            ? null
            : tradingPlatformLeverage!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformLeverageRequest copyWith({
    String? platform,
    bool? tradingPlatformLeverage,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformLeverageRequest(
        platform: platform ?? this.platform,
        tradingPlatformLeverage:
            tradingPlatformLeverage ?? this.tradingPlatformLeverage,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
