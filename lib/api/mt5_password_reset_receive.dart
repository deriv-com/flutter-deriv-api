/// generated automatically from flutter_deriv_api|lib/api/mt5_password_reset_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_password_reset_receive.g.dart';

/// JSON conversion for 'mt5_password_reset_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordResetResponse extends Response {
  /// Initialize Mt5PasswordResetResponse
  Mt5PasswordResetResponse({
    this.mt5PasswordReset,
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
  factory Mt5PasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordResetResponseFromJson(json);

  // Properties
  /// `1` on success
  final int mt5PasswordReset;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordResetResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5PasswordResetResponse copyWith({
    int mt5PasswordReset,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Mt5PasswordResetResponse(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
