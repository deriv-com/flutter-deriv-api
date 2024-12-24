/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_password_change_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform password change request class.
class TradingPlatformPasswordChangeRequest extends Request {
  /// Initialize TradingPlatformPasswordChangeRequest.
  const TradingPlatformPasswordChangeRequest({
    this.loginid,
    required this.newPassword,
    required this.oldPassword,
    required this.platform,
    this.tradingPlatformPasswordChange = true,
    super.msgType = 'trading_platform_password_change',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformPasswordChangeRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformPasswordChangeRequest(
        loginid: json['loginid'] as String?,
        newPassword: json['new_password'] as String?,
        oldPassword: json['old_password'] as String?,
        platform: json['platform'] as String?,
        tradingPlatformPasswordChange:
            json['trading_platform_password_change'] == null
                ? null
                : json['trading_platform_password_change'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// New password of the account. For validation (Accepts any printable ASCII character. DerivX: Must be within 8-25 characters, include numbers, lowercase, uppercase letters. Must not be the same as the user's email address). Accepts any printable ASCII character. MT5: Must be within 8-16 characters, include numbers, lowercase, uppercase letters and special characters. Must not be the same as the user's email address.
  final String? newPassword;

  /// Old password for validation. Must be empty if a password has not been set yet.
  final String? oldPassword;

  /// Name of trading platform.
  final String? platform;

  /// Must be `true`
  final bool? tradingPlatformPasswordChange;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'new_password': newPassword,
        'old_password': oldPassword,
        'platform': platform,
        'trading_platform_password_change':
            tradingPlatformPasswordChange == null
                ? null
                : tradingPlatformPasswordChange!
                    ? 1
                    : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformPasswordChangeRequest copyWith({
    String? loginid,
    String? newPassword,
    String? oldPassword,
    String? platform,
    bool? tradingPlatformPasswordChange,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformPasswordChangeRequest(
        loginid: loginid ?? this.loginid,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        platform: platform ?? this.platform,
        tradingPlatformPasswordChange:
            tradingPlatformPasswordChange ?? this.tradingPlatformPasswordChange,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
