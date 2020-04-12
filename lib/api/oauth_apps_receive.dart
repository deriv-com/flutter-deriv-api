/// generated automatically from flutter_deriv_api|lib/api/oauth_apps_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'oauth_apps_receive.g.dart';

/// JSON conversion for 'oauth_apps_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OauthAppsResponse extends Response {
  /// Initialize OauthAppsResponse
  const OauthAppsResponse({
    this.oauthApps,
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
  factory OauthAppsResponse.fromJson(Map<String, dynamic> json) =>
      _$OauthAppsResponseFromJson(json);

  // Properties
  /// List of OAuth applications that used for the authorized account.
  final List<Map<String, dynamic>> oauthApps;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$OauthAppsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  OauthAppsResponse copyWith({
    List<Map<String, dynamic>> oauthApps,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      OauthAppsResponse(
        oauthApps: oauthApps ?? this.oauthApps,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
