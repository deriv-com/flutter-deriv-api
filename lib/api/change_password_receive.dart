/// generated automatically from flutter_deriv_api|lib/api/change_password_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'change_password_receive.g.dart';

/// JSON conversion for 'change_password_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ChangePasswordResponse extends Response {
  /// Initialize ChangePasswordResponse
  const ChangePasswordResponse({
    this.changePassword,
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
  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  // Properties
  /// If set to 1, password updated.
  final int changePassword;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ChangePasswordResponse copyWith({
    int changePassword,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ChangePasswordResponse(
        changePassword: changePassword ?? this.changePassword,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
