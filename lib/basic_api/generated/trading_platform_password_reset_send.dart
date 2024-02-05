/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_password_reset_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform password reset request class.
class TradingPlatformPasswordResetRequest extends Request {
  /// Initialize TradingPlatformPasswordResetRequest.
  const TradingPlatformPasswordResetRequest({
    this.loginid,
    required this.newPassword,
    required this.platform,
    this.tradingPlatformPasswordReset = true,
    required this.verificationCode,
    super.msgType = 'trading_platform_password_reset',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformPasswordResetRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformPasswordResetRequest(
        loginid: json['loginid'] as String?,
        newPassword: json['new_password'] as String?,
        platform: json['platform'] as String?,
        tradingPlatformPasswordReset:
            json['trading_platform_password_reset'] == null
                ? null
                : json['trading_platform_password_reset'] == 1,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// New password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// Name of trading platform.
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformPasswordReset;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'new_password': newPassword,
        'platform': platform,
        'trading_platform_password_reset': tradingPlatformPasswordReset == null
            ? null
            : tradingPlatformPasswordReset!
                ? 1
                : 0,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformPasswordResetRequest copyWith({
    String? loginid,
    String? newPassword,
    String? platform,
    bool? tradingPlatformPasswordReset,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformPasswordResetRequest(
        loginid: loginid ?? this.loginid,
        newPassword: newPassword ?? this.newPassword,
        platform: platform ?? this.platform,
        tradingPlatformPasswordReset:
            tradingPlatformPasswordReset ?? this.tradingPlatformPasswordReset,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
