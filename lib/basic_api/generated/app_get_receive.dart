/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_get_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// App get response class.
class AppGetResponse extends Response {
  /// Initialize AppGetResponse.
  const AppGetResponse({
    this.appGet,
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
  factory AppGetResponse.fromJson(Map<String, dynamic> json) => AppGetResponse(
        appGet: json['app_get'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information of the requested application.
  final Map<String, dynamic>? appGet;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_get': appGet,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppGetResponse copyWith({
    Map<String, dynamic>? appGet,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AppGetResponse(
        appGet: appGet ?? this.appGet,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
