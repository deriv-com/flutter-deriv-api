/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_status_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform status request class.
class TradingPlatformStatusRequest extends Request {
  /// Initialize TradingPlatformStatusRequest.
  const TradingPlatformStatusRequest({
    this.tradingPlatformStatus = true,
    super.msgType = 'trading_platform_status',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformStatusRequest.fromJson(Map<String, dynamic> json) =>
      TradingPlatformStatusRequest(
        tradingPlatformStatus: json['trading_platform_status'] == null
            ? null
            : json['trading_platform_status'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? tradingPlatformStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_status': tradingPlatformStatus == null
            ? null
            : tradingPlatformStatus!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformStatusRequest copyWith({
    bool? tradingPlatformStatus,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformStatusRequest(
        tradingPlatformStatus:
            tradingPlatformStatus ?? this.tradingPlatformStatus,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
