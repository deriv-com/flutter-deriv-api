/// generated automatically from flutter_deriv_api|lib/api/reset_password_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'reset_password_receive.g.dart';

/// JSON conversion for 'reset_password_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ResetPasswordResponse extends Response {
  /// Initialize ResetPasswordResponse
  const ResetPasswordResponse({
    this.resetPassword,
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
  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  // Properties
  /// `1`: password reset success, `0`: password reset failure
  final int resetPassword;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ResetPasswordResponse copyWith({
    int resetPassword,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ResetPasswordResponse(
        resetPassword: resetPassword ?? this.resetPassword,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
