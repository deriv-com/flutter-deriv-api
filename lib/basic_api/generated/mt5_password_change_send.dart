/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_change_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Mt5 password change request class.
class Mt5PasswordChangeRequest extends Request {
  /// Initialize Mt5PasswordChangeRequest.
  const Mt5PasswordChangeRequest({
    required this.login,
    this.loginid,
    this.mt5PasswordChange = true,
    required this.newPassword,
    required this.oldPassword,
    this.passwordType,
    super.msgType = 'mt5_password_change',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5PasswordChangeRequest.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordChangeRequest(
        login: json['login'] as String?,
        loginid: json['loginid'] as String?,
        mt5PasswordChange: json['mt5_password_change'] == null
            ? null
            : json['mt5_password_change'] == 1,
        newPassword: json['new_password'] as String?,
        oldPassword: json['old_password'] as String?,
        passwordType: json['password_type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// MT5 user login
  final String? login;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? mt5PasswordChange;

  /// New password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? newPassword;

  /// Old password for validation (non-empty string, accepts any printable ASCII character)
  final String? oldPassword;

  /// [Optional] Type of the password to change.
  final String? passwordType;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'loginid': loginid,
        'mt5_password_change': mt5PasswordChange == null
            ? null
            : mt5PasswordChange!
                ? 1
                : 0,
        'new_password': newPassword,
        'old_password': oldPassword,
        'password_type': passwordType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordChangeRequest copyWith({
    String? login,
    String? loginid,
    bool? mt5PasswordChange,
    String? newPassword,
    String? oldPassword,
    String? passwordType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5PasswordChangeRequest(
        login: login ?? this.login,
        loginid: loginid ?? this.loginid,
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        passwordType: passwordType ?? this.passwordType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
