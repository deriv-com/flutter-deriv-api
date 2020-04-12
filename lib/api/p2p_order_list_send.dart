/// generated automatically from flutter_deriv_api|lib/api/p2p_order_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'p2p_order_list_send.g.dart';

/// JSON conversion for 'p2p_order_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pOrderListRequest extends Request {
  /// Initialize P2pOrderListRequest
  const P2pOrderListRequest({
    this.active,
    this.advertId,
    this.limit,
    this.offset,
    this.p2pOrderList = 1,
    this.subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory P2pOrderListRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pOrderListRequestFromJson(json);

  // Properties
  /// [Optional] Should be 1 to list active, 0 to list inactive (historical).
  final num active;

  /// [Optional] If present, lists orders applying to a specific advert.
  final String advertId;

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Used for paging.
  final int offset;

  /// Must be 1
  final int p2pOrderList;

  /// [Optional] If set to 1, will send updates whenever there is a change to any order belonging to you.
  final int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pOrderListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pOrderListRequest copyWith({
    num active,
    String advertId,
    int limit,
    int offset,
    int p2pOrderList,
    int subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      P2pOrderListRequest(
        active: active ?? this.active,
        advertId: advertId ?? this.advertId,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        subscribe: subscribe ?? this.subscribe,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
