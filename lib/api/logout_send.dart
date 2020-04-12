/// generated automatically from flutter_deriv_api|lib/api/logout_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'logout_send.g.dart';

/// JSON conversion for 'logout_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LogoutRequest extends Request {
  /// Initialize LogoutRequest
  const LogoutRequest({
    this.logout = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int logout;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LogoutRequest copyWith({
    int logout,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      LogoutRequest(
        logout: logout ?? this.logout,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
