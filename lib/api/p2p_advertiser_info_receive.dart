/// generated automatically from flutter_deriv_api|lib/api/p2p_advertiser_info_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advertiser_info_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_info_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserInfoResponse extends Response {
  /// Initialize P2pAdvertiserInfoResponse
  P2pAdvertiserInfoResponse({
    this.p2pAdvertiserInfo,
    this.subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory P2pAdvertiserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserInfoResponseFromJson(json);

  // Properties
  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserInfo;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserInfoResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertiserInfoResponse copyWith({
    Map<String, dynamic> p2pAdvertiserInfo,
    Map<String, dynamic> subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pAdvertiserInfoResponse(
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        subscription: subscription ?? this.subscription,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
