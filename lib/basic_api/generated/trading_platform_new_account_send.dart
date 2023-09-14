/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_new_account_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform new account request class.
class TradingPlatformNewAccountRequest extends Request {
  /// Initialize TradingPlatformNewAccountRequest.
  const TradingPlatformNewAccountRequest({
    required this.accountType,
    this.company,
    this.currency,
    this.dryRun,
    required this.marketType,
    this.password,
    required this.platform,
    this.subAccountType,
    this.tradingPlatformNewAccount = true,
    super.msgType = 'trading_platform_new_account',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformNewAccountRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformNewAccountRequest(
        accountType: json['account_type'] as String?,
        company: json['company'] as String?,
        currency: json['currency'] as String?,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        marketType: json['market_type'] as String?,
        password: json['password'] as String?,
        platform: json['platform'] as String?,
        subAccountType: json['sub_account_type'] as String?,
        tradingPlatformNewAccount: json['trading_platform_new_account'] == null
            ? null
            : json['trading_platform_new_account'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Account type.
  final String? accountType;

  /// [Optional] Name of the client's company (For DerivEZ only)
  final String? company;

  /// [Optional] Trading account currency, the default value will be the qualified account currency.
  final String? currency;

  /// [Optional] If set to `true`, only validation is performed.
  final bool? dryRun;

  /// Market type
  final String? marketType;

  /// The master password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address). Only for DXTrade.
  final String? password;

  /// Name of trading platform.
  final String? platform;

  /// [Optional] Sub account type.
  final String? subAccountType;

  /// Must be `true`
  final bool? tradingPlatformNewAccount;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_type': accountType,
        'company': company,
        'currency': currency,
        'dry_run': dryRun == null
            ? null
            : dryRun!
                ? 1
                : 0,
        'market_type': marketType,
        'password': password,
        'platform': platform,
        'sub_account_type': subAccountType,
        'trading_platform_new_account': tradingPlatformNewAccount == null
            ? null
            : tradingPlatformNewAccount!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformNewAccountRequest copyWith({
    String? accountType,
    String? company,
    String? currency,
    bool? dryRun,
    String? marketType,
    String? password,
    String? platform,
    String? subAccountType,
    bool? tradingPlatformNewAccount,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformNewAccountRequest(
        accountType: accountType ?? this.accountType,
        company: company ?? this.company,
        currency: currency ?? this.currency,
        dryRun: dryRun ?? this.dryRun,
        marketType: marketType ?? this.marketType,
        password: password ?? this.password,
        platform: platform ?? this.platform,
        subAccountType: subAccountType ?? this.subAccountType,
        tradingPlatformNewAccount:
            tradingPlatformNewAccount ?? this.tradingPlatformNewAccount,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
