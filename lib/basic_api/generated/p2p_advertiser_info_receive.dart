/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_info_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_advertiser_info_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_info_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserInfoResponse extends Response {
  /// Initialize P2pAdvertiserInfoResponse
  const P2pAdvertiserInfoResponse({
    this.p2pAdvertiserInfo,
    this.subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory P2pAdvertiserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserInfoResponseFromJson(json);

  // Properties
  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserInfo;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserInfoResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserInfoResponse copyWith({
    Map<String, dynamic> p2pAdvertiserInfo,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserInfoResponse(
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
