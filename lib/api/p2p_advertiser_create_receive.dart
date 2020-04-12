/// generated automatically from flutter_deriv_api|lib/api/p2p_advertiser_create_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advertiser_create_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_create_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserCreateResponse extends Response {
  /// Initialize P2pAdvertiserCreateResponse
  P2pAdvertiserCreateResponse({
    this.p2pAdvertiserCreate,
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

  /// Creates instance from JSON
  factory P2pAdvertiserCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserCreateResponseFromJson(json);

  // Properties
  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserCreate;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserCreateResponseToJson(this);
}
