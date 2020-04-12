/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_info_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'p2p_advert_info_send.g.dart';

/// JSON conversion for 'p2p_advert_info_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertInfoRequest extends Request {
  /// Initialize P2pAdvertInfoRequest
  P2pAdvertInfoRequest({
    this.id,
    this.p2pAdvertInfo = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory P2pAdvertInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertInfoRequestFromJson(json);

  // Properties
  /// The unique identifier for this advert.
  final String id;

  /// Must be 1
  final int p2pAdvertInfo;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertInfoRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertInfoRequest copyWith({
    String id,
    int p2pAdvertInfo,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      P2pAdvertInfoRequest(
        id: id ?? this.id,
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
