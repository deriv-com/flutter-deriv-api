/// Autogenerated from flutter_deriv_api|lib/api/p2p_advertiser_info_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'p2p_advertiser_info_send.g.dart';

/// JSON conversion for 'p2p_advertiser_info_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserInfoRequest extends Request {
  /// Initialize P2pAdvertiserInfoRequest
  P2pAdvertiserInfoRequest({
    this.id,
    this.p2pAdvertiserInfo = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advertiser_info',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pAdvertiserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserInfoRequestFromJson(json);

  // Properties
  /// [Optional] The unique identifier for this advertiser. If not provided, returns advertiser information about the current account.
  String id;

  /// Must be 1
  int p2pAdvertiserInfo;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserInfoRequestToJson(this);
}
