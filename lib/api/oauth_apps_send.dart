/// generated automatically from flutter_deriv_api|lib/api/oauth_apps_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'oauth_apps_send.g.dart';

/// JSON conversion for 'oauth_apps_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OauthAppsRequest extends Request {
  /// Initialize OauthAppsRequest
  const OauthAppsRequest({
    this.oauthApps = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory OauthAppsRequest.fromJson(Map<String, dynamic> json) =>
      _$OauthAppsRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int oauthApps;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$OauthAppsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  OauthAppsRequest copyWith({
    int oauthApps,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      OauthAppsRequest(
        oauthApps: oauthApps ?? this.oauthApps,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
