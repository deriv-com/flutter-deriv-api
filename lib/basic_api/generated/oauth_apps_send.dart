/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/oauth_apps_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Oauth apps request class.
class OauthAppsRequest extends Request {
  /// Initialize OauthAppsRequest.
  const OauthAppsRequest({
    this.loginid,
    this.oauthApps = true,
    super.msgType = 'oauth_apps',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory OauthAppsRequest.fromJson(Map<String, dynamic> json) =>
      OauthAppsRequest(
        loginid: json['loginid'] as String?,
        oauthApps: json['oauth_apps'] == null ? null : json['oauth_apps'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? oauthApps;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'oauth_apps': oauthApps == null
            ? null
            : oauthApps!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  OauthAppsRequest copyWith({
    String? loginid,
    bool? oauthApps,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      OauthAppsRequest(
        loginid: loginid ?? this.loginid,
        oauthApps: oauthApps ?? this.oauthApps,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
