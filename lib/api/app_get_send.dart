/// Autogenerated from flutter_deriv_api|lib/api/app_get_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'app_get_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppGetRequest {
  AppGetRequest();
  factory AppGetRequest.fromJson(Map<String, dynamic> json) =>
      _$AppGetRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AppGetRequestToJson(this);

  // Properties
  int appGet;

  /// Application app_id
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
