/// Autogenerated from flutter_deriv_api|lib/api/p2p_advertiser_update_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'p2p_advertiser_update_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserUpdateResponse {
  P2pAdvertiserUpdateResponse(
      {this.echoReq, this.msgType, this.p2pAdvertiserUpdate, this.reqId});
  factory P2pAdvertiserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserUpdateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$P2pAdvertiserUpdateResponseToJson(this);

  // Properties
  /// Echo of the request made.
  Map<String, dynamic> echoReq;

  /// Action name of the request made.
  String msgType;

  /// P2P advertiser information.
  Map<String, dynamic> p2pAdvertiserUpdate;

  /// Optional field sent in request to map to response, present only when request contains `req_id`.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
