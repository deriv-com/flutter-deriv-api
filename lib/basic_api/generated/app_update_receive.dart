/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_update_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// App update response class
class AppUpdateResponse extends Response {
  /// Initialize AppUpdateResponse
  const AppUpdateResponse({
    this.appUpdate,
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
  factory AppUpdateResponse.fromJson(Map<String, dynamic> json) =>
      AppUpdateResponse(
        appUpdate: json['app_update'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Information of the updated application.
  final Map<String, dynamic> appUpdate;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_update': appUpdate,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppUpdateResponse copyWith({
    Map<String, dynamic> appUpdate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppUpdateResponse(
        appUpdate: appUpdate ?? this.appUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
