/// generated automatically from flutter_deriv_api|lib/api/mt5_password_change_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_password_change_receive.g.dart';

/// JSON conversion for 'mt5_password_change_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordChangeResponse extends Response {
  /// Initialize Mt5PasswordChangeResponse
  const Mt5PasswordChangeResponse({
    this.mt5PasswordChange,
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
  factory Mt5PasswordChangeResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordChangeResponseFromJson(json);

  // Properties
  /// `1` on success
  final int mt5PasswordChange;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordChangeResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5PasswordChangeResponse copyWith({
    int mt5PasswordChange,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Mt5PasswordChangeResponse(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
