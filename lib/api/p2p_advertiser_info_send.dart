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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
}
