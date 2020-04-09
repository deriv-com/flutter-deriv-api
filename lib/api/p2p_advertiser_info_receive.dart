/// Autogenerated from flutter_deriv_api|lib/api/p2p_advertiser_info_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'p2p_advertiser_info_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_info_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserInfoResponse extends Response {
  /// Initialize P2pAdvertiserInfoResponse
  P2pAdvertiserInfoResponse(
      {this.p2pAdvertiserInfo,
      this.subscription,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory P2pAdvertiserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserInfoResponseFromJson(json);

  // Properties
  /// P2P advertiser information.
  Map<String, dynamic> p2pAdvertiserInfo;

  /// For subscription requests only.
  Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserInfoResponseToJson(this);
}
