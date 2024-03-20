/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_check_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Mt5 password check request class.
class Mt5PasswordCheckRequest extends Request {
  /// Initialize Mt5PasswordCheckRequest.
  const Mt5PasswordCheckRequest({
    required this.login,
    this.loginid,
    this.mt5PasswordCheck = true,
    required this.password,
    this.passwordType,
    super.msgType = 'mt5_password_check',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5PasswordCheckRequest.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordCheckRequest(
        login: json['login'] as String?,
        loginid: json['loginid'] as String?,
        mt5PasswordCheck: json['mt5_password_check'] == null
            ? null
            : json['mt5_password_check'] == 1,
        password: json['password'] as String?,
        passwordType: json['password_type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// MT5 user login
  final String? login;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? mt5PasswordCheck;

  /// The password of the account.
  final String? password;

  /// [Optional] Type of the password to check.
  final String? passwordType;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'loginid': loginid,
        'mt5_password_check': mt5PasswordCheck == null
            ? null
            : mt5PasswordCheck!
                ? 1
                : 0,
        'password': password,
        'password_type': passwordType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordCheckRequest copyWith({
    String? login,
    String? loginid,
    bool? mt5PasswordCheck,
    String? password,
    String? passwordType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5PasswordCheckRequest(
        login: login ?? this.login,
        loginid: loginid ?? this.loginid,
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        password: password ?? this.password,
        passwordType: passwordType ?? this.passwordType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
