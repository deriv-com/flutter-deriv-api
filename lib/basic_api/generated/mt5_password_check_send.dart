/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_check_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Mt5 password check request class.
class Mt5PasswordCheckRequest extends Request {
  /// Initialize Mt5PasswordCheckRequest.
  const Mt5PasswordCheckRequest({
    required this.login,
    this.mt5PasswordCheck = true,
    required this.password,
    this.passwordType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'mt5_password_check',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory Mt5PasswordCheckRequest.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordCheckRequest(
        login: json['login'] as String?,
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
    bool? mt5PasswordCheck,
    String? password,
    String? passwordType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5PasswordCheckRequest(
        login: login ?? this.login,
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        password: password ?? this.password,
        passwordType: passwordType ?? this.passwordType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
