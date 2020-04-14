/// generated automatically from flutter_deriv_api|lib/api/mt5_password_check_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'mt5_password_check_send.g.dart';

/// JSON conversion for 'mt5_password_check_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordCheckRequest extends Request {
  /// Initialize Mt5PasswordCheckRequest
  const Mt5PasswordCheckRequest({
    this.login,
    this.mt5PasswordCheck = 1,
    this.password,
    this.passwordType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory Mt5PasswordCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordCheckRequestFromJson(json);

  // Properties
  /// MT5 user login
  final String login;

  /// Must be `1`
  final int mt5PasswordCheck;

  /// The password of the account.
  final String password;

  /// [Optional] Type of the password to check.
  final String passwordType;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordCheckRequestToJson(this);

  /// Creates copy of instance with given parameters
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
