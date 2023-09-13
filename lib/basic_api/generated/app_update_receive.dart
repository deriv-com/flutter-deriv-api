/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_update_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// App update receive class.
class AppUpdateReceive extends Response {
  /// Initialize AppUpdateReceive.
  const AppUpdateReceive({
    this.appUpdate,
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
  factory AppUpdateReceive.fromJson(Map<String, dynamic> json) =>
      AppUpdateReceive(
        appUpdate: json['app_update'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Information of the updated application.
  final Map<String, dynamic>? appUpdate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_update': appUpdate,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppUpdateReceive copyWith({
    Map<String, dynamic>? appUpdate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AppUpdateReceive(
        appUpdate: appUpdate ?? this.appUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
