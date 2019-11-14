/// Autogenerated from flutter_deriv_api|lib/api/sell_expired_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sell_expired_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellExpiredRequest {
  SellExpiredRequest();
  factory SellExpiredRequest.fromJson(Map<String, dynamic> json) =>
      _$SellExpiredRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SellExpiredRequestToJson(this);

  // Properties
  int sellExpired;

  /// Must be 1
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
