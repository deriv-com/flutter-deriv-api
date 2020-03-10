/// Autogenerated from flutter_deriv_api|lib/api/mt5_password_reset_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'mt5_password_reset_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordResetRequest {
  Mt5PasswordResetRequest(
      {this.login,
      this.mt5PasswordReset,
      this.newPassword,
      this.passthrough,
      this.passwordType,
      this.reqId,
      this.verificationCode});
  factory Mt5PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordResetRequestFromJson(json);
  Map<String, dynamic> toJson() => _$Mt5PasswordResetRequestToJson(this);

  // Properties
  /// MT5 user login
  String login;

  /// Must be `1`
  int mt5PasswordReset;

  /// New password of the account. For validation (length within 8-25 chars, accepts at least 2 out of the following 3 types of characters: uppercase letters, lowercase letters, and numbers).
  String newPassword;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Type of the password to reset.
  String passwordType;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  String verificationCode;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
