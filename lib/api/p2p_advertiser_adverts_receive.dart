/// generated automatically from flutter_deriv_api|lib/api/p2p_advertiser_adverts_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advertiser_adverts_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_adverts_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserAdvertsResponse extends Response {
  /// Initialize P2pAdvertiserAdvertsResponse
  const P2pAdvertiserAdvertsResponse({
    this.p2pAdvertiserAdverts,
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

  /// Creates instance from JSON
  factory P2pAdvertiserAdvertsResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserAdvertsResponseFromJson(json);

  // Properties
  /// List of the P2P advertiser adverts.
  final Map<String, dynamic> p2pAdvertiserAdverts;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserAdvertsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertiserAdvertsResponse copyWith({
    Map<String, dynamic> p2pAdvertiserAdverts,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserAdvertsResponse(
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
