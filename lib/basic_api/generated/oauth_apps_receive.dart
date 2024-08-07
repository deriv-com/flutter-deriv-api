/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/oauth_apps_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Oauth apps receive class.
class OauthAppsReceive extends Response {
  /// Initialize OauthAppsReceive.
  const OauthAppsReceive({
    this.oauthApps,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory OauthAppsReceive.fromJson(Map<String, dynamic> json) =>
      OauthAppsReceive(
        oauthApps: (json['oauth_apps'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of 3rd party OAuth applications that used for the authorized account.
  final List<Map<String, dynamic>>? oauthApps;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'oauth_apps': oauthApps,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  OauthAppsReceive copyWith({
    List<Map<String, dynamic>>? oauthApps,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      OauthAppsReceive(
        oauthApps: oauthApps ?? this.oauthApps,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
