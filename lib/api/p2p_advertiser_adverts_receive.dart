/// Autogenerated from flutter_deriv_api|lib/api/p2p_advertiser_adverts_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'p2p_advertiser_adverts_receive.g.dart';

///
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserAdvertsResponse extends Response {
  ///
  P2pAdvertiserAdvertsResponse(
      {this.p2pAdvertiserAdverts,
      int reqId,
      Map<String, dynamic> echoReq,
      String msgType,
      Map<String, dynamic> error})
      : super(reqId: reqId, echoReq: echoReq, msgType: msgType, error: error);

  /// Instance from JSON
  factory P2pAdvertiserAdvertsResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserAdvertsResponseFromJson(json);

  /// Instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserAdvertsResponseToJson(this);

  // Properties
  /// List of the P2P advertiser adverts.
  Map<String, dynamic> p2pAdvertiserAdverts;
}
