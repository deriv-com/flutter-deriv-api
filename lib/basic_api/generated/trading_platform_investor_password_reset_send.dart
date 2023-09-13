/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_investor_password_reset_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform investor password reset request class.
class TradingPlatformInvestorPasswordResetRequest extends Request {
  /// Initialize TradingPlatformInvestorPasswordResetRequest.
  const TradingPlatformInvestorPasswordResetRequest({
    required this.accountId,
    required this.newPassword,
    required this.platform,
    this.tradingPlatformInvestorPasswordReset = true,
    required this.verificationCode,
    super.msgType = 'trading_platform_investor_password_reset',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformInvestorPasswordResetRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformInvestorPasswordResetRequest(
        accountId: json['account_id'] as String?,
        newPassword: json['new_password'] as String?,
        platform: json['platform'] as String?,
        tradingPlatformInvestorPasswordReset:
            json['trading_platform_investor_password_reset'] == null
                ? null
                : json['trading_platform_investor_password_reset'] == 1,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Trading account ID.
  final String? accountId;

  /// New password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// Name of trading platform.
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformInvestorPasswordReset;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_id': accountId,
        'new_password': newPassword,
        'platform': platform,
        'trading_platform_investor_password_reset':
            tradingPlatformInvestorPasswordReset == null
                ? null
                : tradingPlatformInvestorPasswordReset!
                    ? 1
                    : 0,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformInvestorPasswordResetRequest copyWith({
    String? accountId,
    String? newPassword,
    String? platform,
    bool? tradingPlatformInvestorPasswordReset,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformInvestorPasswordResetRequest(
        accountId: accountId ?? this.accountId,
        newPassword: newPassword ?? this.newPassword,
        platform: platform ?? this.platform,
        tradingPlatformInvestorPasswordReset:
            tradingPlatformInvestorPasswordReset ??
                this.tradingPlatformInvestorPasswordReset,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
