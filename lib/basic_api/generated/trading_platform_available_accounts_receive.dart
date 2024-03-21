/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_available_accounts_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform available accounts receive class.
class TradingPlatformAvailableAccountsReceive extends Response {
  /// Initialize TradingPlatformAvailableAccountsReceive.
  const TradingPlatformAvailableAccountsReceive({
    this.tradingPlatformAvailableAccounts,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAvailableAccountsReceive.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformAvailableAccountsReceive(
        tradingPlatformAvailableAccounts:
            (json['trading_platform_available_accounts'] as List<dynamic>?)
                ?.map<Map<String, dynamic>>(
                    (dynamic item) => item as Map<String, dynamic>)
                .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Available Trading Accounts
  final List<Map<String, dynamic>>? tradingPlatformAvailableAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_available_accounts': tradingPlatformAvailableAccounts,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformAvailableAccountsReceive copyWith({
    List<Map<String, dynamic>>? tradingPlatformAvailableAccounts,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformAvailableAccountsReceive(
        tradingPlatformAvailableAccounts: tradingPlatformAvailableAccounts ??
            this.tradingPlatformAvailableAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
