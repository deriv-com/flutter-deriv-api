/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_delete_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// App delete receive class.
class AppDeleteReceive extends Response {
  /// Initialize AppDeleteReceive.
  const AppDeleteReceive({
    this.appDelete,
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
  factory AppDeleteReceive.fromJson(Map<String, dynamic> json) =>
      AppDeleteReceive(
        appDelete: json['app_delete'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// 1 on success
  final int? appDelete;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_delete': appDelete,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppDeleteReceive copyWith({
    int? appDelete,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AppDeleteReceive(
        appDelete: appDelete ?? this.appDelete,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
