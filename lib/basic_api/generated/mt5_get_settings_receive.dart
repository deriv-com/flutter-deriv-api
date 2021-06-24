/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_get_settings_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Mt5 get settings response class
class Mt5GetSettingsResponse extends Response {
  /// Initialize Mt5GetSettingsResponse
  const Mt5GetSettingsResponse({
    this.mt5GetSettings,
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

  /// Creates an instance from JSON
  factory Mt5GetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: json['mt5_get_settings'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// MT5 user account details
  final Map<String, dynamic>? mt5GetSettings;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_get_settings': mt5GetSettings,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5GetSettingsResponse copyWith({
    Map<String, dynamic>? mt5GetSettings,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
