/// Autogenerated from flutter_deriv_api|lib/api/mt5_password_check_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'mt5_password_check_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordCheckRequest {
  Mt5PasswordCheckRequest();
  factory Mt5PasswordCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordCheckRequestFromJson(json);
  Map<String, dynamic> toJson() => _$Mt5PasswordCheckRequestToJson(this);

  // Properties
  int mt5PasswordCheck;

  /// Must be 1
  String login;

  /// MT5 user login
  String password;

  /// The password of the account.
  String passwordType;

  /// The password type main/investor (default: 'main')
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
