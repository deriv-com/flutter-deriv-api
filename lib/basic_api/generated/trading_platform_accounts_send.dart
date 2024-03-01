/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_accounts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform accounts request class.
class TradingPlatformAccountsRequest extends Request {
  /// Initialize TradingPlatformAccountsRequest.
  const TradingPlatformAccountsRequest({
    this.loginid,
    required this.platform,
    this.tradingPlatformAccounts = true,
    super.msgType = 'trading_platform_accounts',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAccountsRequest.fromJson(Map<String, dynamic> json) =>
      TradingPlatformAccountsRequest(
        loginid: json['loginid'] as String?,
        platform: json['platform'] as String?,
        tradingPlatformAccounts: json['trading_platform_accounts'] == null
            ? null
            : json['trading_platform_accounts'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Trading platform name
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
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
    String? loginid,
    String? platform,
    bool? tradingPlatformAccounts,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformAccountsRequest(
        loginid: loginid ?? this.loginid,
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
