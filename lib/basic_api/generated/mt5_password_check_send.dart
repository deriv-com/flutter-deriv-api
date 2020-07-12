/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_check_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// Mt5PasswordCheckRequest class
class Mt5PasswordCheckRequest extends Request {
  /// Initialize Mt5PasswordCheckRequest
  const Mt5PasswordCheckRequest({
    @required this.login,
    this.mt5PasswordCheck = 1,
    @required this.password,
    this.passwordType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'mt5_password_check',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordCheckRequest.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordCheckRequest(
        // ignore: avoid_as
        login: json['login'] as String,
        // ignore: avoid_as
        mt5PasswordCheck: json['mt5_password_check'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        password: json['password'] as String,
        // ignore: avoid_as
        passwordType: json['password_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// MT5 user login
  final String login;

  /// Must be `1`
  final int mt5PasswordCheck;

  /// The password of the account.
  final String password;

  /// [Optional] Type of the password to check.
  final String passwordType;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'mt5_password_check': mt5PasswordCheck,
        'passthrough': passthrough,
        'password': password,
        'password_type': passwordType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordCheckRequest copyWith({
    String login,
    int mt5PasswordCheck,
    String password,
    String passwordType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5PasswordCheckRequest(
        login: login ?? this.login,
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        password: password ?? this.password,
        passwordType: passwordType ?? this.passwordType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
