/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_accounts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform accounts request class.
class TradingPlatformAccountsRequest extends Request {
  /// Initialize TradingPlatformAccountsRequest.
  const TradingPlatformAccountsRequest({
    required this.platform,
    this.tradingPlatformAccounts = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'trading_platform_accounts',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformAccountsRequest.fromJson(Map<String, dynamic> json) =>
      TradingPlatformAccountsRequest(
        platform: json['platform'] as String?,
        tradingPlatformAccounts: json['trading_platform_accounts'] == null
            ? null
            : json['trading_platform_accounts'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Trading platform name
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'trading_platform_accounts': tradingPlatformAccounts == null
            ? null
            : tradingPlatformAccounts!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformAccountsRequest copyWith({
    String? platform,
    bool? tradingPlatformAccounts,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformAccountsRequest(
        platform: platform ?? this.platform,
        tradingPlatformAccounts:
            tradingPlatformAccounts ?? this.tradingPlatformAccounts,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
