/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_check_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'mt5_password_check_receive.g.dart';

/// JSON conversion for 'mt5_password_check_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordCheckResponse extends Response {
  /// Initialize Mt5PasswordCheckResponse
  const Mt5PasswordCheckResponse({
    this.mt5PasswordCheck,
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
  factory Mt5PasswordCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordCheckResponseFromJson(json);

  /// `1` on success
  final int mt5PasswordCheck;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordCheckResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordCheckResponse copyWith({
    int mt5PasswordCheck,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5PasswordCheckResponse(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
