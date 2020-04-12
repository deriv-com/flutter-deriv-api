/// generated automatically from flutter_deriv_api|lib/api/p2p_advertiser_info_send.json
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
    this.subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory P2pAdvertiserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertiserInfoRequestFromJson(json);

  // Properties
  /// [Optional] The unique identifier for this advertiser. If not provided, returns advertiser information about the current account.
  final String id;

  /// Must be 1
  final int p2pAdvertiserInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to advertiser
  final int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertiserInfoRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertiserInfoRequest copyWith({
    String id,
    int p2pAdvertiserInfo,
    int subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      P2pAdvertiserInfoRequest(
        id: id ?? this.id,
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        subscribe: subscribe ?? this.subscribe,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
