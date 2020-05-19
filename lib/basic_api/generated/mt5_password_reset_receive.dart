/// generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_reset_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'mt5_password_reset_receive.g.dart';

/// JSON conversion for 'mt5_password_reset_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class Mt5PasswordResetResponse extends Response {
  /// Initialize Mt5PasswordResetResponse
  const Mt5PasswordResetResponse({
    this.mt5PasswordReset,
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
  factory Mt5PasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordResetResponseFromJson(json);

  // Properties
  /// `1` on success
  final int mt5PasswordReset;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordResetResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordResetResponse copyWith({
    int mt5PasswordReset,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5PasswordResetResponse(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
