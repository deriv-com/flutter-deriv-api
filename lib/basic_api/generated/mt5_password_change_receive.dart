/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_change_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'mt5_password_change_receive.g.dart';

/// JSON conversion for 'mt5_password_change_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class Mt5PasswordChangeResponse extends Response {
  /// Initialize Mt5PasswordChangeResponse
  const Mt5PasswordChangeResponse({
    this.mt5PasswordChange,
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
  factory Mt5PasswordChangeResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordChangeResponseFromJson(json);

  /// `1` on success
  final int mt5PasswordChange;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordChangeResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordChangeResponse copyWith({
    int mt5PasswordChange,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5PasswordChangeResponse(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
