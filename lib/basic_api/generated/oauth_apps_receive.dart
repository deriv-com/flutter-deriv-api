/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/oauth_apps_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'oauth_apps_receive.g.dart';

/// JSON conversion for 'oauth_apps_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OauthAppsResponse extends Response {
  /// Initialize OauthAppsResponse
  const OauthAppsResponse({
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

  /// Creates an instance from JSON
  factory OauthAppsResponse.fromJson(Map<String, dynamic> json) =>
      _$OauthAppsResponseFromJson(json);

  /// List of OAuth applications that used for the authorized account.
  final List<Map<String, dynamic>> oauthApps;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$OauthAppsResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  OauthAppsResponse copyWith({
    List<Map<String, dynamic>> oauthApps,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      OauthAppsResponse(
        oauthApps: oauthApps ?? this.oauthApps,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
