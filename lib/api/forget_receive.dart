/// Autogenerated from flutter_deriv_api|lib/api/forget_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'forget_receive.g.dart';

/// JSON conversion for 'forget_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ForgetResponse extends Response {
  /// Initialize ForgetResponse
  ForgetResponse(
      {this.forget,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory ForgetResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetResponseFromJson(json);

  // Properties
  /// If set to 1, stream exited and stopped. If set to 0, stream did not exist.
  int forget;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetResponseToJson(this);
}
