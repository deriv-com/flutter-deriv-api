/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_settings_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p settings request class.
class P2pSettingsRequest extends Request {
  /// Initialize P2pSettingsRequest.
  const P2pSettingsRequest({
    this.loginid,
    this.p2pSettings = true,
    this.subscribe,
    super.msgType = 'p2p_settings',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pSettingsRequest.fromJson(Map<String, dynamic> json) =>
      P2pSettingsRequest(
        loginid: json['loginid'] as String?,
        p2pSettings:
            json['p2p_settings'] == null ? null : json['p2p_settings'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pSettings;

  /// [Optional] If set to `true`, will send updates whenever there is an update to P2P settings.
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'p2p_settings': p2pSettings == null
            ? null
            : p2pSettings!
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pSettingsRequest copyWith({
    String? loginid,
    bool? p2pSettings,
    bool? subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pSettingsRequest(
        loginid: loginid ?? this.loginid,
        p2pSettings: p2pSettings ?? this.p2pSettings,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
