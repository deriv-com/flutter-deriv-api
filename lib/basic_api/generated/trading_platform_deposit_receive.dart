/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_deposit_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform deposit receive class.
class TradingPlatformDepositReceive extends Response {
  /// Initialize TradingPlatformDepositReceive.
  const TradingPlatformDepositReceive({
    this.tradingPlatformDeposit,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformDepositReceive.fromJson(Map<String, dynamic> json) =>
      TradingPlatformDepositReceive(
        tradingPlatformDeposit: json['trading_platform_deposit'] as dynamic,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Information about deposit transaction, or status of demo account top up.
  final dynamic tradingPlatformDeposit;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_deposit': tradingPlatformDeposit,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformDepositReceive copyWith({
    dynamic tradingPlatformDeposit,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformDepositReceive(
        tradingPlatformDeposit:
            tradingPlatformDeposit ?? this.tradingPlatformDeposit,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
