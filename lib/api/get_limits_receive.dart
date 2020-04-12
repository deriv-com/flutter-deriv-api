/// generated automatically from flutter_deriv_api|lib/api/get_limits_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'get_limits_receive.g.dart';

/// JSON conversion for 'get_limits_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetLimitsResponse extends Response {
  /// Initialize GetLimitsResponse
  GetLimitsResponse({
    this.getLimits,
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
  factory GetLimitsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLimitsResponseFromJson(json);

  // Properties
  /// Trading limits of real account user
  final Map<String, dynamic> getLimits;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetLimitsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetLimitsResponse copyWith({
    Map<String, dynamic> getLimits,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      GetLimitsResponse(
        getLimits: getLimits ?? this.getLimits,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
