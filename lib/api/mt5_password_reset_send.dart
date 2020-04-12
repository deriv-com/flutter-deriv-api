/// generated automatically from flutter_deriv_api|lib/api/mt5_password_reset_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'mt5_password_reset_send.g.dart';

/// JSON conversion for 'mt5_password_reset_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordResetRequest extends Request {
  /// Initialize Mt5PasswordResetRequest
  const Mt5PasswordResetRequest({
    this.login,
    this.mt5PasswordReset = 1,
    this.newPassword,
    this.passwordType,
    this.verificationCode,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory Mt5PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordResetRequestFromJson(json);

  // Properties
  /// MT5 user login
  final String login;

  /// Must be `1`
  final int mt5PasswordReset;

  /// New password of the account. For validation (length within 8-25 chars, accepts at least 2 out of the following 3 types of characters: uppercase letters, lowercase letters, and numbers).
  final String newPassword;

  /// [Optional] Type of the password to reset.
  final String passwordType;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordResetRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5PasswordResetRequest copyWith({
    String login,
    int mt5PasswordReset,
    String newPassword,
    String passwordType,
    String verificationCode,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      Mt5PasswordResetRequest(
        login: login ?? this.login,
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
        newPassword: newPassword ?? this.newPassword,
        passwordType: passwordType ?? this.passwordType,
        verificationCode: verificationCode ?? this.verificationCode,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
