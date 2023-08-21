/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_withdrawal_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform withdrawal receive class.
class TradingPlatformWithdrawalReceive extends Response {
  /// Initialize TradingPlatformWithdrawalReceive.
  const TradingPlatformWithdrawalReceive({
    this.tradingPlatformWithdrawal,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformWithdrawalReceive.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformWithdrawalReceive(
        tradingPlatformWithdrawal:
            json['trading_platform_withdrawal'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Information about withdrawal transaction
  final Map<String, dynamic>? tradingPlatformWithdrawal;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_withdrawal': tradingPlatformWithdrawal,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformWithdrawalReceive copyWith({
    Map<String, dynamic>? tradingPlatformWithdrawal,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformWithdrawalReceive(
        tradingPlatformWithdrawal:
            tradingPlatformWithdrawal ?? this.tradingPlatformWithdrawal,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
