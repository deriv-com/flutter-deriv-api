/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_available_accounts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform available accounts request class.
class TradingPlatformAvailableAccountsRequest extends Request {
  /// Initialize TradingPlatformAvailableAccountsRequest.
  const TradingPlatformAvailableAccountsRequest({
    required this.platform,
    this.tradingPlatformAvailableAccounts = true,
    super.msgType = 'trading_platform_available_accounts',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAvailableAccountsRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformAvailableAccountsRequest(
        platform: json['platform'] as String?,
        tradingPlatformAvailableAccounts:
            json['trading_platform_available_accounts'] == null
                ? null
                : json['trading_platform_available_accounts'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Name of trading platform.
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformAvailableAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'trading_platform_available_accounts':
            tradingPlatformAvailableAccounts == null
                ? null
                : tradingPlatformAvailableAccounts!
                    ? 1
                    : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformAvailableAccountsRequest copyWith({
    String? platform,
    bool? tradingPlatformAvailableAccounts,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformAvailableAccountsRequest(
        platform: platform ?? this.platform,
        tradingPlatformAvailableAccounts: tradingPlatformAvailableAccounts ??
            this.tradingPlatformAvailableAccounts,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
