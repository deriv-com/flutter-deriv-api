/// generated automatically from flutter_deriv_api|lib/api/mt5_password_change_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'mt5_password_change_send.g.dart';

/// JSON conversion for 'mt5_password_change_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordChangeRequest extends Request {
  /// Initialize Mt5PasswordChangeRequest
  Mt5PasswordChangeRequest({
    this.login,
    this.mt5PasswordChange = 1,
    this.newPassword,
    this.oldPassword,
    this.passwordType,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory Mt5PasswordChangeRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordChangeRequestFromJson(json);

  // Properties
  /// MT5 user login
  final String login;

  /// Must be `1`
  final int mt5PasswordChange;

  /// New password of the account. For validation (length within 8-25 chars, accepts at least 2 out of the following 3 types of characters: uppercase letters, lowercase letters, and numbers).
  final String newPassword;

  /// Old password for validation (non-empty string, accepts any printable ASCII character)
  final String oldPassword;

  /// [Optional] Type of the password to change.
  final String passwordType;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordChangeRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5PasswordChangeRequest copyWith({
    String login,
    int mt5PasswordChange,
    String newPassword,
    String oldPassword,
    String passwordType,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      Mt5PasswordChangeRequest(
        login: login ?? this.login,
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        passwordType: passwordType ?? this.passwordType,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
