/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_settings_receive.json

import '../response.dart';

/// GetSettingsResponse class
class GetSettingsResponse extends Response {
  /// Initialize GetSettingsResponse
  const GetSettingsResponse({
    this.getSettings,
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
  factory GetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      GetSettingsResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        getSettings: json['get_settings'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// User information and settings.
  final Map<String, dynamic> getSettings;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'get_settings': getSettings,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSettingsResponse copyWith({
    Map<String, dynamic> getSettings,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetSettingsResponse(
        getSettings: getSettings ?? this.getSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
