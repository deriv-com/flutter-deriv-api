/// generated automatically from flutter_deriv_api|lib/api/login_history_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'login_history_send.g.dart';

/// JSON conversion for 'login_history_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LoginHistoryRequest extends Request {
  /// Initialize LoginHistoryRequest
  const LoginHistoryRequest({
    this.limit,
    this.loginHistory = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory LoginHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginHistoryRequestFromJson(json);

  // Properties
  /// [Optional] Apply limit to count of login history records.
  final int limit;

  /// Must be `1`
  final int loginHistory;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LoginHistoryRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LoginHistoryRequest copyWith({
    int limit,
    int loginHistory,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      LoginHistoryRequest(
        limit: limit ?? this.limit,
        loginHistory: loginHistory ?? this.loginHistory,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
