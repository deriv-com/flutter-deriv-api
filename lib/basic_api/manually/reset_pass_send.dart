// ignore_for_file: avoid_as

import '../request.dart';

/// Reset password request class.
class PasswordResetRequest extends Request {
  /// Initialize PasswordResetRequest.
  const PasswordResetRequest({
    required this.newPassword,
    required this.verificationCode,
    this.resetPassword = 1,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'password_reset',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// New password. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// Must be `1`.
  final int? resetPassword;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String? verificationCode;

  /// Converts this instance to JSON.
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_password': newPassword,
        'reset_password': resetPassword,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
