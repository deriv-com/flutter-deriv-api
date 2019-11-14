/// Autogenerated from flutter_deriv_api|lib/api/forget_all_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'forget_all_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ForgetAllResponse {
  ForgetAllResponse();
  factory ForgetAllResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetAllResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetAllResponseToJson(this);

  // Properties
  List<String> forgetAll;

  /// IDs of the cancelled streams
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
