/// generated automatically from flutter_deriv_api|lib/api/revoke_oauth_app_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'revoke_oauth_app_receive.g.dart';

/// JSON conversion for 'revoke_oauth_app_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RevokeOauthAppResponse extends Response {
  /// Initialize RevokeOauthAppResponse
  const RevokeOauthAppResponse({
    this.revokeOauthApp,
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
  factory RevokeOauthAppResponse.fromJson(Map<String, dynamic> json) =>
      _$RevokeOauthAppResponseFromJson(json);

  // Properties
  /// `1` on success
  final int revokeOauthApp;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$RevokeOauthAppResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  RevokeOauthAppResponse copyWith({
    int revokeOauthApp,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      RevokeOauthAppResponse(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
