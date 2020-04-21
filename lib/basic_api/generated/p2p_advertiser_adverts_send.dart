/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_adverts_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_advertiser_adverts_send.g.dart';

/// JSON conversion for 'p2p_advertiser_adverts_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertiserAdvertsRequest extends Request {
  /// Initialize P2pAdvertiserAdvertsRequest
  const P2pAdvertiserAdvertsRequest({
    this.limit,
    this.offset,
    this.p2pAdvertiserAdverts = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pAdvertiserAdvertsRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserAdvertsRequestFromJson(json);

  // Properties
  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Used for paging.
  final int offset;

  /// Must be 1
  final int p2pAdvertiserAdverts;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserAdvertsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertiserAdvertsRequest copyWith({
    int limit,
    int offset,
    int p2pAdvertiserAdverts,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertiserAdvertsRequest(
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
