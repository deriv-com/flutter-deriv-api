/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_create_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_advertiser_create_receive.g.dart';

/// JSON conversion for 'p2p_advertiser_create_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserCreateResponse extends Response {
  /// Initialize P2pAdvertiserCreateResponse
  const P2pAdvertiserCreateResponse({
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

  /// Creates an instance from JSON
  factory P2pAdvertiserCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserCreateResponseFromJson(json);

  // Properties
  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserCreate;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserCreateResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserCreateResponse copyWith({
    Map<String, dynamic> p2pAdvertiserCreate,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserCreateResponse(
        p2pAdvertiserCreate: p2pAdvertiserCreate ?? this.p2pAdvertiserCreate,
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
