/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_settings_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Set settings receive class.
class SetSettingsReceive extends Response {
  /// Initialize SetSettingsReceive.
  const SetSettingsReceive({
    this.setSettings,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory SetSettingsReceive.fromJson(Map<String, dynamic> json) =>
      SetSettingsReceive(
        setSettings: json['set_settings'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// 1 on success
  final int? setSettings;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'set_settings': setSettings,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetSettingsReceive copyWith({
    int? setSettings,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      SetSettingsReceive(
        setSettings: setSettings ?? this.setSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
