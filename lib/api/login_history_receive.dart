/// generated automatically from flutter_deriv_api|lib/api/login_history_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'login_history_receive.g.dart';

/// JSON conversion for 'login_history_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LoginHistoryResponse extends Response {
  /// Initialize LoginHistoryResponse
  const LoginHistoryResponse({
    this.loginHistory,
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
  factory LoginHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginHistoryResponseFromJson(json);

  // Properties
  /// Array of records of client login/logout activities
  final List<Map<String, dynamic>> loginHistory;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LoginHistoryResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LoginHistoryResponse copyWith({
    List<Map<String, dynamic>> loginHistory,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      LoginHistoryResponse(
        loginHistory: loginHistory ?? this.loginHistory,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
