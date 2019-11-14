/// Autogenerated from flutter_deriv_api|lib/api/mt5_password_change_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'mt5_password_change_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordChangeResponse {
  Mt5PasswordChangeResponse();
  factory Mt5PasswordChangeResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordChangeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$Mt5PasswordChangeResponseToJson(this);

  // Properties
  int mt5PasswordChange;

  /// 1 on success
  Map<String, dynamic> echoReq;

  /// Echo of the request made.
  String msgType;

  /// Action name of the request made.
  int reqId;

  /// Optional field sent in request to map to response, present only when request contains req_id.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
