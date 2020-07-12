/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_change_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// Mt5PasswordChangeRequest class
class Mt5PasswordChangeRequest extends Request {
  /// Initialize Mt5PasswordChangeRequest
  const Mt5PasswordChangeRequest({
    @required this.login,
    this.mt5PasswordChange = true,
    @required this.newPassword,
    @required this.oldPassword,
    this.passwordType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'mt5_password_change',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordChangeRequest.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordChangeRequest(
        // ignore: avoid_as
        login: json['login'] as String,
        mt5PasswordChange: json['mt5_password_change'] == null
            ? null
            : json['mt5_password_change'] == 1,
        // ignore: avoid_as
        newPassword: json['new_password'] as String,
        // ignore: avoid_as
        oldPassword: json['old_password'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        passwordType: json['password_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// MT5 user login
  final String login;

  /// Must be `true`
  final bool mt5PasswordChange;

  /// New password of the account. For validation (length within 8-25 chars, accepts at least 2 out of the following 3 types of characters: uppercase letters, lowercase letters, and numbers).
  final String newPassword;

  /// Old password for validation (non-empty string, accepts any printable ASCII character)
  final String oldPassword;

  /// [Optional] Type of the password to change.
  final String passwordType;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'mt5_password_change':
            mt5PasswordChange == null ? null : mt5PasswordChange ? 1 : 0,
        'new_password': newPassword,
        'old_password': oldPassword,
        'passthrough': passthrough,
        'password_type': passwordType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordChangeRequest copyWith({
    String login,
    bool mt5PasswordChange,
    String newPassword,
    String oldPassword,
    String passwordType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5PasswordChangeRequest(
        login: login ?? this.login,
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        passwordType: passwordType ?? this.passwordType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
