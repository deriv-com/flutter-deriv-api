// ignore_for_file: avoid_as

import '../request.dart';

/// Reset password request class.
class ResetPasswordRequest extends Request {
  /// Initialize PasswordResetRequest.
  const ResetPasswordRequest({
    required this.newPassword,
    required this.verificationCode,
    this.dateOfBirth,
    this.resetPassword = 1,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'reset_password',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// New password. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// Must be `1`.
  final int? resetPassword;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String? verificationCode;
  
  /// [Optional] Date of birth format: `yyyy-mm-dd`. Only required for clients with real-money accounts..
  final String? dateOfBirth;

  /// Converts this instance to JSON.
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_password': newPassword,
        'reset_password': resetPassword,
        'verification_code': verificationCode,
        'date_of_birth': dateOfBirth,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
