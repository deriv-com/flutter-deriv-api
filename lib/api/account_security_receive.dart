/// Autogenerated from flutter_deriv_api|lib/api/account_security_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'account_security_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AccountSecurityResponse {
  AccountSecurityResponse(
      {this.accountSecurity, this.echoReq, this.msgType, this.reqId});
  factory AccountSecurityResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountSecurityResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AccountSecurityResponseToJson(this);

  // Properties
  /// The information of 2-Factor authentication.
  Map<String, dynamic> accountSecurity;

  /// Echo of the request made.
  Map<String, dynamic> echoReq;

  /// Action name of the request made.
  String msgType;

  /// Optional field sent in request to map to response, present only when request contains `req_id`.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
