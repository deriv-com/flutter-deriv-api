/// generated automatically from flutter_deriv_api|lib/basic_api/generated/login_history_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'login_history_send.g.dart';

/// JSON conversion for 'login_history_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LoginHistoryRequest extends Request {
  /// Initialize LoginHistoryRequest
  const LoginHistoryRequest({
    this.limit,
    this.loginHistory = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory LoginHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginHistoryRequestFromJson(json);

  // Properties
  /// [Optional] Apply limit to count of login history records.
  final int limit;

  /// Must be `1`
  final int loginHistory;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$LoginHistoryRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LoginHistoryRequest copyWith({
    int limit,
    int loginHistory,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      LoginHistoryRequest(
        limit: limit ?? this.limit,
        loginHistory: loginHistory ?? this.loginHistory,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
