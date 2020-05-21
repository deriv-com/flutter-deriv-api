/// generated automatically from flutter_deriv_api|lib/basic_api/generated/logout_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'logout_send.g.dart';

/// JSON conversion for 'logout_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LogoutRequest extends Request {
  /// Initialize LogoutRequest
  const LogoutRequest({
    this.logout = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'logout',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int logout;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LogoutRequest copyWith({
    int logout,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      LogoutRequest(
        logout: logout ?? this.logout,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
