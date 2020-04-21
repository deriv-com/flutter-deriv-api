/// generated automatically from flutter_deriv_api|lib/basic_api/generated/set_self_exclusion_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'set_self_exclusion_receive.g.dart';

/// JSON conversion for 'set_self_exclusion_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetSelfExclusionResponse extends Response {
  /// Initialize SetSelfExclusionResponse
  const SetSelfExclusionResponse({
    this.setSelfExclusion,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SetSelfExclusionResponse(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
