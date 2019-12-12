/// Autogenerated from flutter_deriv_api|lib/api/sell_expired_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sell_expired_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellExpiredRequest {
  SellExpiredRequest({this.passthrough, this.reqId, this.sellExpired});
  factory SellExpiredRequest.fromJson(Map<String, dynamic> json) =>
      _$SellExpiredRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SellExpiredRequestToJson(this);

  // Properties
  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Must be `1`
  int sellExpired;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
