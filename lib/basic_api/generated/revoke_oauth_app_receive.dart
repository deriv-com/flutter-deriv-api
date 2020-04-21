/// generated automatically from flutter_deriv_api|lib/basic_api/generated/revoke_oauth_app_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'revoke_oauth_app_receive.g.dart';

/// JSON conversion for 'revoke_oauth_app_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RevokeOauthAppResponse extends Response {
  /// Initialize RevokeOauthAppResponse
  const RevokeOauthAppResponse({
    this.revokeOauthApp,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      RevokeOauthAppResponse(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
