/// generated automatically from flutter_deriv_api|lib/api/mt5_password_check_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_password_check_receive.g.dart';

/// JSON conversion for 'mt5_password_check_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordCheckResponse extends Response {
  /// Initialize Mt5PasswordCheckResponse
  const Mt5PasswordCheckResponse({
    this.mt5PasswordCheck,
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
  factory Mt5PasswordCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordCheckResponseFromJson(json);

  // Properties
  /// `1` on success
  final int mt5PasswordCheck;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordCheckResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5PasswordCheckResponse copyWith({
    int mt5PasswordCheck,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Mt5PasswordCheckResponse(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
