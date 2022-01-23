/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_investor_password_change_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform investor password change request class.
class TradingPlatformInvestorPasswordChangeRequest extends Request {
  /// Initialize TradingPlatformInvestorPasswordChangeRequest.
  const TradingPlatformInvestorPasswordChangeRequest({
    required this.accountId,
    required this.newPassword,
    required this.oldPassword,
    required this.platform,
    this.tradingPlatformInvestorPasswordChange = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'trading_platform_investor_password_change',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformInvestorPasswordChangeRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformInvestorPasswordChangeRequest(
        accountId: json['account_id'] as String?,
        newPassword: json['new_password'] as String?,
        oldPassword: json['old_password'] as String?,
        platform: json['platform'] as String?,
        tradingPlatformInvestorPasswordChange:
            json['trading_platform_investor_password_change'] == null
                ? null
                : json['trading_platform_investor_password_change'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Trading account ID.
  final String? accountId;

  /// New investor password. Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address.
  final String? newPassword;

  /// Old investor password for validation (non-empty string, accepts any printable ASCII character)
  final String? oldPassword;

  /// Name of trading platform.
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformInvestorPasswordChange;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_id': accountId,
        'new_password': newPassword,
        'old_password': oldPassword,
        'platform': platform,
        'trading_platform_investor_password_change':
            tradingPlatformInvestorPasswordChange == null
                ? null
                : tradingPlatformInvestorPasswordChange!
                    ? 1
                    : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformInvestorPasswordChangeRequest copyWith({
    String? accountId,
    String? newPassword,
    String? oldPassword,
    String? platform,
    bool? tradingPlatformInvestorPasswordChange,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformInvestorPasswordChangeRequest(
        accountId: accountId ?? this.accountId,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        platform: platform ?? this.platform,
        tradingPlatformInvestorPasswordChange:
            tradingPlatformInvestorPasswordChange ??
                this.tradingPlatformInvestorPasswordChange,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
