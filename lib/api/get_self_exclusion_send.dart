/// generated automatically from flutter_deriv_api|lib/api/get_self_exclusion_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'get_self_exclusion_send.g.dart';

/// JSON conversion for 'get_self_exclusion_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetSelfExclusionRequest extends Request {
  /// Initialize GetSelfExclusionRequest
  const GetSelfExclusionRequest({
    this.getSelfExclusion = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory GetSelfExclusionRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSelfExclusionRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int getSelfExclusion;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetSelfExclusionRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetSelfExclusionRequest copyWith({
    int getSelfExclusion,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      GetSelfExclusionRequest(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
