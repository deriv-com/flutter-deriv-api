/// Autogenerated from flutter_deriv_api|lib/api/reset_password_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'reset_password_send.g.dart';

/// JSON conversion for 'reset_password_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ResetPasswordRequest extends Request {
  /// Initialize ResetPasswordRequest
  ResetPasswordRequest({
    this.dateOfBirth,
    this.newPassword,
    this.resetPassword = 1,
    this.verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'reset_password',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  // Properties
  /// [Optional] Date of birth format: `yyyy-mm-dd`. Only required for clients with real-money accounts.
  String dateOfBirth;

  /// New password for validation (length within 6-25 chars, accepts any printable ASCII characters, need to include capital and lowercase letters with numbers). Password strength is evaluated with: http://archive.geekwisdom.com/js/passwordmeter.js
  String newPassword;

  /// Must be `1`
  int resetPassword;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  String verificationCode;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
