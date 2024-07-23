/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/change_password_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Change password request class.
class ChangePasswordRequest extends Request {
  /// Initialize ChangePasswordRequest.
  const ChangePasswordRequest({
    this.changePassword = true,
    this.loginid,
    required this.newPassword,
    required this.oldPassword,
    super.msgType = 'change_password',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequest(
        changePassword: json['change_password'] == null
            ? null
            : json['change_password'] == 1,
        loginid: json['loginid'] as String?,
        newPassword: json['new_password'] as String?,
        oldPassword: json['old_password'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? changePassword;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// New password (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address)
  final String? newPassword;

  /// Old password for validation (non-empty string, accepts any printable ASCII character)
  final String? oldPassword;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'change_password': changePassword == null
            ? null
            : changePassword!
                ? 1
                : 0,
        'loginid': loginid,
        'new_password': newPassword,
        'old_password': oldPassword,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ChangePasswordRequest copyWith({
    bool? changePassword,
    String? loginid,
    String? newPassword,
    String? oldPassword,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ChangePasswordRequest(
        changePassword: changePassword ?? this.changePassword,
        loginid: loginid ?? this.loginid,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
