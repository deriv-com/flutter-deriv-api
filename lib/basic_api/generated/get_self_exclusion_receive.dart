/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_self_exclusion_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'get_self_exclusion_receive.g.dart';

/// JSON conversion for 'get_self_exclusion_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetSelfExclusionResponse extends Response {
  /// Initialize GetSelfExclusionResponse
  const GetSelfExclusionResponse({
    this.getSelfExclusion,
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
  factory GetSelfExclusionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSelfExclusionResponseFromJson(json);

  /// List of values set for self exclusion.
  final Map<String, dynamic> getSelfExclusion;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$GetSelfExclusionResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  GetSelfExclusionResponse copyWith({
    Map<String, dynamic> getSelfExclusion,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetSelfExclusionResponse(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
