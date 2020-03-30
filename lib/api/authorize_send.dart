/// Autogenerated from flutter_deriv_api|lib/api/authorize_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'authorize_send.g.dart';

/// JSON conversion for 'authorize_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class AuthorizeRequest extends Request {
  /// Initialize AuthorizeRequest
  AuthorizeRequest(
      {this.addToLoginHistory,
      this.authorize,
      Map<String, dynamic> passthrough,
      int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory AuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeRequestFromJson(json);

  // Properties
  /// [Optional] Send this when you use api tokens for authorization and want to track activity using `login_history` call.
  int addToLoginHistory;

  /// Authentication token. May be retrieved from https://www.binary.com/en/user/security/api_tokenws.html
  String authorize;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AuthorizeRequestToJson(this);
}
