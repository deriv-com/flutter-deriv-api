/// generated automatically from flutter_deriv_api|lib/api/oauth_apps_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'oauth_apps_receive.g.dart';

/// JSON conversion for 'oauth_apps_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OauthAppsResponse extends Response {
  /// Initialize OauthAppsResponse
  OauthAppsResponse({
    this.oauthApps,
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
  factory OauthAppsResponse.fromJson(Map<String, dynamic> json) =>
      _$OauthAppsResponseFromJson(json);

  // Properties
  /// List of OAuth applications that used for the authorized account.
  final List<Map<String, dynamic>> oauthApps;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$OauthAppsResponseToJson(this);
}
