/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_status_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform status receive class.
class TradingPlatformStatusReceive extends Response {
  /// Initialize TradingPlatformStatusReceive.
  const TradingPlatformStatusReceive({
    this.tradingPlatformStatus,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformStatusReceive.fromJson(Map<String, dynamic> json) =>
      TradingPlatformStatusReceive(
        tradingPlatformStatus:
            json['trading_platform_status'] as List<dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Availability status of the trading platforms
  final List<dynamic>? tradingPlatformStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_status': tradingPlatformStatus,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformStatusReceive copyWith({
    List<dynamic>? tradingPlatformStatus,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformStatusReceive(
        tradingPlatformStatus:
            tradingPlatformStatus ?? this.tradingPlatformStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
