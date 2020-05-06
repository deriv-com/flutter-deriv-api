/// generated automatically from flutter_deriv_api|lib/basic_api/generated/login_history_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'login_history_receive.g.dart';

/// JSON conversion for 'login_history_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LoginHistoryResponse extends Response {
  /// Initialize LoginHistoryResponse
  const LoginHistoryResponse({
    this.loginHistory,
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
  factory LoginHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginHistoryResponseFromJson(json);

  // Properties
  /// Array of records of client login/logout activities
  final List<Map<String, dynamic>> loginHistory;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$LoginHistoryResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LoginHistoryResponse copyWith({
    List<Map<String, dynamic>> loginHistory,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      LoginHistoryResponse(
        loginHistory: loginHistory ?? this.loginHistory,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
