/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_accounts_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform accounts receive class.
class TradingPlatformAccountsReceive extends Response {
  /// Initialize TradingPlatformAccountsReceive.
  const TradingPlatformAccountsReceive({
    this.tradingPlatformAccounts,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAccountsReceive.fromJson(Map<String, dynamic> json) =>
      TradingPlatformAccountsReceive(
        tradingPlatformAccounts:
            (json['trading_platform_accounts'] as List<dynamic>?)
                ?.map<Map<String, dynamic>>(
                    (dynamic item) => item as Map<String, dynamic>)
                .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Array containing Trading account objects.
  final List<Map<String, dynamic>>? tradingPlatformAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_accounts': tradingPlatformAccounts,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformAccountsReceive copyWith({
    List<Map<String, dynamic>>? tradingPlatformAccounts,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformAccountsReceive(
        tradingPlatformAccounts:
            tradingPlatformAccounts ?? this.tradingPlatformAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
