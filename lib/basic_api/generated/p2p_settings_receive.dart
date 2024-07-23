/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_settings_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p settings receive class.
class P2pSettingsReceive extends Response {
  /// Initialize P2pSettingsReceive.
  const P2pSettingsReceive({
    this.p2pSettings,
    this.subscription,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pSettingsReceive.fromJson(Map<String, dynamic> json) =>
      P2pSettingsReceive(
        p2pSettings: json['p2p_settings'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Peer-to-peer payment system settings.
  final Map<String, dynamic>? p2pSettings;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_settings': p2pSettings,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pSettingsReceive copyWith({
    Map<String, dynamic>? p2pSettings,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pSettingsReceive(
        p2pSettings: p2pSettings ?? this.p2pSettings,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
