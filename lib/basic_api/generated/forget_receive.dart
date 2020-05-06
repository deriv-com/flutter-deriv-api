/// generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'forget_receive.g.dart';

/// JSON conversion for 'forget_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ForgetResponse extends Response {
  /// Initialize ForgetResponse
  const ForgetResponse({
    this.forget,
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
  factory ForgetResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetResponseFromJson(json);

  // Properties
  /// If set to 1, stream exited and stopped. If set to 0, stream did not exist.
  final int forget;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ForgetResponse copyWith({
    int forget,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ForgetResponse(
        forget: forget ?? this.forget,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
