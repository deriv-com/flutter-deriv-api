/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_investor_password_change_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform investor password change response class.
class TradingPlatformInvestorPasswordChangeResponse extends Response {
  /// Initialize TradingPlatformInvestorPasswordChangeResponse.
  const TradingPlatformInvestorPasswordChangeResponse({
    this.tradingPlatformPasswordChange,
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
  factory TradingPlatformInvestorPasswordChangeResponse.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformInvestorPasswordChangeResponse(
        tradingPlatformPasswordChange:
            json['trading_platform_password_change'] == null
                ? null
                : json['trading_platform_password_change'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// If set to `true`, the password has been updated.
  final bool? tradingPlatformPasswordChange;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_password_change':
            tradingPlatformPasswordChange == null
                ? null
                : tradingPlatformPasswordChange!
                    ? 1
                    : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformInvestorPasswordChangeResponse copyWith({
    bool? tradingPlatformPasswordChange,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformInvestorPasswordChangeResponse(
        tradingPlatformPasswordChange:
            tradingPlatformPasswordChange ?? this.tradingPlatformPasswordChange,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
