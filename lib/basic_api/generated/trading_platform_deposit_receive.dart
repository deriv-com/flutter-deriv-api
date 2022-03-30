/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_deposit_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform deposit response class.
class TradingPlatformDepositResponse extends Response {
  /// Initialize TradingPlatformDepositResponse.
  const TradingPlatformDepositResponse({
    this.tradingPlatformDeposit,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformDepositResponse.fromJson(Map<String, dynamic> json) =>
      TradingPlatformDepositResponse(
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
  TradingPlatformDepositResponse copyWith({
    dynamic tradingPlatformDeposit,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformDepositResponse(
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
