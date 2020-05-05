/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_advertiser_update_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserUpdateResponse extends Response {
  /// Initialize P2pAdvertiserUpdateResponse
  const P2pAdvertiserUpdateResponse({
    this.p2pAdvertiserUpdate,
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
  factory P2pAdvertiserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserUpdateResponseFromJson(json);

  // Properties
  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserUpdate;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserUpdateResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserUpdateResponse copyWith({
    Map<String, dynamic> p2pAdvertiserUpdate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
