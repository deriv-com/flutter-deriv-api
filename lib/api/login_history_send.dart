/// generated automatically from flutter_deriv_api|lib/api/login_history_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'login_history_send.g.dart';

/// JSON conversion for 'login_history_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LoginHistoryRequest extends Request {
  /// Initialize LoginHistoryRequest
  LoginHistoryRequest({
    this.limit,
    this.loginHistory = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
}
