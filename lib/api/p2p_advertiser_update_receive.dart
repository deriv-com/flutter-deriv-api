/// generated automatically from flutter_deriv_api|lib/api/p2p_advertiser_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advertiser_update_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserUpdateResponse extends Response {
  /// Initialize P2pAdvertiserUpdateResponse
  const P2pAdvertiserUpdateResponse({
    this.p2pAdvertiserUpdate,
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
  factory P2pAdvertiserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserUpdateResponseFromJson(json);

  // Properties
  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserUpdate;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserUpdateResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertiserUpdateResponse copyWith({
    Map<String, dynamic> p2pAdvertiserUpdate,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
