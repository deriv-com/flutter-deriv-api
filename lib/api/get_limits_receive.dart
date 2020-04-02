/// Autogenerated from flutter_deriv_api|lib/api/get_limits_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'get_limits_receive.g.dart';

/// JSON conversion for 'get_limits_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetLimitsResponse extends Response {
  /// Initialize GetLimitsResponse
  GetLimitsResponse(
      {this.getLimits,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory GetLimitsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLimitsResponseFromJson(json);

  // Properties
  /// Trading limits of real account user
  Map<String, dynamic> getLimits;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetLimitsResponseToJson(this);
}
