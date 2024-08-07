/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reset_password_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Reset password request class.
class ResetPasswordRequest extends Request {
  /// Initialize ResetPasswordRequest.
  const ResetPasswordRequest({
    required this.newPassword,
    this.resetPassword = true,
    required this.verificationCode,
    super.msgType = 'reset_password',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequest(
        newPassword: json['new_password'] as String?,
        resetPassword:
            json['reset_password'] == null ? null : json['reset_password'] == 1,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// New password. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// Must be `true`
  final bool? resetPassword;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_password': newPassword,
        'reset_password': resetPassword == null
            ? null
            : resetPassword!
                ? 1
                : 0,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResetPasswordRequest copyWith({
    String? newPassword,
    bool? resetPassword,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ResetPasswordRequest(
        newPassword: newPassword ?? this.newPassword,
        resetPassword: resetPassword ?? this.resetPassword,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
