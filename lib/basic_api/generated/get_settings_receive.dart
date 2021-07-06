/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_settings_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Get settings receive class.
class GetSettingsReceive extends Response {
  /// Initialize GetSettingsReceive.
  const GetSettingsReceive({
    this.getSettings,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory GetSettingsReceive.fromJson(Map<String, dynamic> json) =>
      GetSettingsReceive(
        getSettings: json['get_settings'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// User information and settings.
  final Map<String, dynamic>? getSettings;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_settings': getSettings,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetSettingsReceive copyWith({
    Map<String, dynamic>? getSettings,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      GetSettingsReceive(
        getSettings: getSettings ?? this.getSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
