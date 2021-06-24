/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_reset_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Mt5 password reset request class
class Mt5PasswordResetRequest extends Request {
  /// Initialize Mt5PasswordResetRequest
  const Mt5PasswordResetRequest({
    @required this.login,
    this.mt5PasswordReset = true,
    @required this.newPassword,
    this.passwordType,
    @required this.verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'mt5_password_reset',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordResetRequest(
        login: json['login'] as String?,
        mt5PasswordReset: json['mt5_password_reset'] == null
            ? null
            : json['mt5_password_reset'] == 1,
        newPassword: json['new_password'] as String?,
        passwordType: json['password_type'] as String?,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// MT5 user login
  final String? login;

  /// Must be `true`
  final bool? mt5PasswordReset;

  /// New password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// [Optional] Type of the password to reset.
  final String? passwordType;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'mt5_password_reset': mt5PasswordReset == null
            ? null
            : mt5PasswordReset!
                ? 1
                : 0,
        'new_password': newPassword,
        'password_type': passwordType,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordResetRequest copyWith({
    String? login,
    bool? mt5PasswordReset,
    String? newPassword,
    String? passwordType,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5PasswordResetRequest(
        login: login ?? this.login,
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
        newPassword: newPassword ?? this.newPassword,
        passwordType: passwordType ?? this.passwordType,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
