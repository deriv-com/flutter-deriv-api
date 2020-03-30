/// Autogenerated from flutter_deriv_api|lib/api/revoke_oauth_app_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'revoke_oauth_app_receive.g.dart';

/// JSON conversion for 'revoke_oauth_app_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class RevokeOauthAppResponse extends Response {
  /// Initialize RevokeOauthAppResponse
  RevokeOauthAppResponse(
      {this.revokeOauthApp,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory RevokeOauthAppResponse.fromJson(Map<String, dynamic> json) =>
      _$RevokeOauthAppResponseFromJson(json);

  // Properties
  /// `1` on success
  int revokeOauthApp;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$RevokeOauthAppResponseToJson(this);
}
