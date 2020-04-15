/// generated automatically from flutter_deriv_api|lib/api/reset_password_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'reset_password_send.g.dart';

/// JSON conversion for 'reset_password_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ResetPasswordRequest extends Request {
  /// Initialize ResetPasswordRequest
  const ResetPasswordRequest({
    this.dateOfBirth,
    this.newPassword,
    this.resetPassword = 1,
    this.verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  // Properties
  /// [Optional] Date of birth format: `yyyy-mm-dd`. Only required for clients with real-money accounts.
  final String dateOfBirth;

  /// New password for validation (length within 6-25 chars, accepts any printable ASCII characters, need to include capital and lowercase letters with numbers). Password strength is evaluated with: http://archive.geekwisdom.com/js/passwordmeter.js
  final String newPassword;

  /// Must be `1`
  final int resetPassword;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ResetPasswordRequest copyWith({
    String dateOfBirth,
    String newPassword,
    int resetPassword,
    String verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ResetPasswordRequest(
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        newPassword: newPassword ?? this.newPassword,
        resetPassword: resetPassword ?? this.resetPassword,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
