/// Autogenerated from flutter_deriv_api|lib/api/change_password_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ChangePasswordRequest {
  ChangePasswordRequest(
      {this.changePassword,
      this.newPassword,
      this.oldPassword,
      this.passthrough,
      this.reqId});
  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  // Properties
  /// Must be `1`
  num changePassword;

  /// New password (length within 6-25 chars, accepts any printable ASCII character)
  String newPassword;

  /// Old password for validation (non-empty string, accepts any printable ASCII character)
  String oldPassword;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
