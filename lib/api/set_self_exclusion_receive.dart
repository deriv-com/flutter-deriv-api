/// generated automatically from flutter_deriv_api|lib/api/set_self_exclusion_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'set_self_exclusion_receive.g.dart';

/// JSON conversion for 'set_self_exclusion_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetSelfExclusionResponse extends Response {
  /// Initialize SetSelfExclusionResponse
  const SetSelfExclusionResponse({
    this.setSelfExclusion,
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
  factory SetSelfExclusionResponse.fromJson(Map<String, dynamic> json) =>
      _$SetSelfExclusionResponseFromJson(json);

  // Properties
  /// `1` on success
  final int setSelfExclusion;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SetSelfExclusionResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SetSelfExclusionResponse copyWith({
    int setSelfExclusion,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      SetSelfExclusionResponse(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
