/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_settings_receive.json

import '../response.dart';

/// SetSettingsResponse class
class SetSettingsResponse extends Response {
  /// Initialize SetSettingsResponse
  const SetSettingsResponse({
    this.setSettings,
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
  factory SetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      SetSettingsResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        setSettings: json['set_settings'] as int,
      );

  /// 1 on success
  final int setSettings;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'set_settings': setSettings,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetSettingsResponse copyWith({
    int setSettings,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SetSettingsResponse(
        setSettings: setSettings ?? this.setSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
