/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_investor_password_reset_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform investor password reset receive class.
class TradingPlatformInvestorPasswordResetReceive extends Response {
  /// Initialize TradingPlatformInvestorPasswordResetReceive.
  const TradingPlatformInvestorPasswordResetReceive({
    this.tradingPlatformPasswordReset,
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
  factory TradingPlatformInvestorPasswordResetReceive.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformInvestorPasswordResetReceive(
        tradingPlatformPasswordReset:
            json['trading_platform_password_reset'] == null
                ? null
                : json['trading_platform_password_reset'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// If set to `true`, the investor password has been reset.
  final bool? tradingPlatformPasswordReset;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_password_reset': tradingPlatformPasswordReset == null
            ? null
            : tradingPlatformPasswordReset!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformInvestorPasswordResetReceive copyWith({
    bool? tradingPlatformPasswordReset,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformInvestorPasswordResetReceive(
        tradingPlatformPasswordReset:
            tradingPlatformPasswordReset ?? this.tradingPlatformPasswordReset,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
