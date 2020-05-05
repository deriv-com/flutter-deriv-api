/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_update_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_advert_update_send.g.dart';

/// JSON conversion for 'p2p_advert_update_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertUpdateRequest extends Request {
  /// Initialize P2pAdvertUpdateRequest
  const P2pAdvertUpdateRequest({
    this.delete,
    this.id,
    this.isActive,
    this.p2pAdvertUpdate = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory P2pAdvertUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertUpdateRequestFromJson(json);

  // Properties
  /// [Optional] If set to 1, permanently deletes the advert.
  final int delete;

  /// The unique identifier for this advert.
  final String id;

  /// [Optional] Activate or deactivate the advert.
  final int isActive;

  /// Must be 1
  final int p2pAdvertUpdate;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertUpdateRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertUpdateRequest copyWith({
    int delete,
    String id,
    int isActive,
    int p2pAdvertUpdate,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertUpdateRequest(
        delete: delete ?? this.delete,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
