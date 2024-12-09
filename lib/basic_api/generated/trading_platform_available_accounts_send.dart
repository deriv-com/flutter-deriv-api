/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_available_accounts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform available accounts request class.
class TradingPlatformAvailableAccountsRequest extends Request {
  /// Initialize TradingPlatformAvailableAccountsRequest.
  const TradingPlatformAvailableAccountsRequest({
    this.countryCode,
    this.loginid,
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
        countryCode: json['country_code'] as String?,
        loginid: json['loginid'] as String?,
        platform: json['platform'] as String?,
        tradingPlatformAvailableAccounts:
            json['trading_platform_available_accounts'] == null
                ? null
                : json['trading_platform_available_accounts'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Country code for which available accounts are returned. If not specified (deprecated) the current user residence country is used or (not deprecated) country code corresponding to the caller IP address is used.
  final String? countryCode;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// Name of trading platform.
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformAvailableAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country_code': countryCode,
        'loginid': loginid,
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
    String? countryCode,
    String? loginid,
    String? platform,
    bool? tradingPlatformAvailableAccounts,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformAvailableAccountsRequest(
        countryCode: countryCode ?? this.countryCode,
        loginid: loginid ?? this.loginid,
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
