/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_new_account_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform new account response class.
class TradingPlatformNewAccountResponse extends Response {
  /// Initialize TradingPlatformNewAccountResponse.
  const TradingPlatformNewAccountResponse({
    this.tradingPlatformNewAccount,
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
  factory TradingPlatformNewAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformNewAccountResponse(
        tradingPlatformNewAccount:
            json['trading_platform_new_account'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// New Trading account details
  final Map<String, dynamic>? tradingPlatformNewAccount;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_new_account': tradingPlatformNewAccount,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformNewAccountResponse copyWith({
    Map<String, dynamic>? tradingPlatformNewAccount,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformNewAccountResponse(
        tradingPlatformNewAccount:
            tradingPlatformNewAccount ?? this.tradingPlatformNewAccount,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
