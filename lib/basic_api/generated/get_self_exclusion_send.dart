/// generated automatically from flutter_deriv_api|lib/basic_api/generated/get_self_exclusion_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'get_self_exclusion_send.g.dart';

/// JSON conversion for 'get_self_exclusion_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class GetSelfExclusionRequest extends Request {
  /// Initialize GetSelfExclusionRequest
  const GetSelfExclusionRequest({
    this.getSelfExclusion = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_self_exclusion',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetSelfExclusionRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSelfExclusionRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int getSelfExclusion;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$GetSelfExclusionRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  GetSelfExclusionRequest copyWith({
    int getSelfExclusion,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetSelfExclusionRequest(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
