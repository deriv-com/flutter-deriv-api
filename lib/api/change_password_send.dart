/// generated automatically from flutter_deriv_api|lib/api/change_password_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'change_password_send.g.dart';

/// JSON conversion for 'change_password_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ChangePasswordRequest extends Request {
  /// Initialize ChangePasswordRequest
  const ChangePasswordRequest({
    this.changePassword,
    this.newPassword,
    this.oldPassword,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  // Properties
  /// Must be `1`
  final num changePassword;

  /// New password (length within 6-25 chars, accepts any printable ASCII character)
  final String newPassword;

  /// Old password for validation (non-empty string, accepts any printable ASCII character)
  final String oldPassword;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ChangePasswordRequest copyWith({
    num changePassword,
    String newPassword,
    String oldPassword,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ChangePasswordRequest(
        changePassword: changePassword ?? this.changePassword,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
