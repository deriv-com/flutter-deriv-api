/// generated automatically from flutter_deriv_api|lib/api/forget_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'forget_receive.g.dart';

/// JSON conversion for 'forget_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ForgetResponse extends Response {
  /// Initialize ForgetResponse
  ForgetResponse({
    this.forget,
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
  factory ForgetResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetResponseFromJson(json);

  // Properties
  /// If set to 1, stream exited and stopped. If set to 0, stream did not exist.
  final int forget;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ForgetResponse copyWith({
    int forget,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ForgetResponse(
        forget: forget ?? this.forget,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
