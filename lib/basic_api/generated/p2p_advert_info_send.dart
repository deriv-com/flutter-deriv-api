/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_advert_info_send.g.dart';

/// JSON conversion for 'p2p_advert_info_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertInfoRequest extends Request {
  /// Initialize P2pAdvertInfoRequest
  const P2pAdvertInfoRequest({
    this.id,
    this.p2pAdvertInfo = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertInfoRequest(
        id: id ?? this.id,
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
