/// generated automatically from flutter_deriv_api|lib/api/get_self_exclusion_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'get_self_exclusion_receive.g.dart';

/// JSON conversion for 'get_self_exclusion_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetSelfExclusionResponse extends Response {
  /// Initialize GetSelfExclusionResponse
  const GetSelfExclusionResponse({
    this.getSelfExclusion,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory GetSelfExclusionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSelfExclusionResponseFromJson(json);

  // Properties
  /// List of values set for self exclusion.
  final Map<String, dynamic> getSelfExclusion;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetSelfExclusionResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetSelfExclusionResponse copyWith({
    Map<String, dynamic> getSelfExclusion,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      GetSelfExclusionResponse(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
