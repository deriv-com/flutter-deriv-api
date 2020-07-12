/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_list_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// App list response class
class AppListResponse extends Response {
  /// Initialize AppListResponse
  const AppListResponse({
    this.appList,
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
  factory AppListResponse.fromJson(Map<String, dynamic> json) =>
      AppListResponse(
        appList: (json['app_list'] as List)
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// List of created applications for the authorized account.
  final List<Map<String, dynamic>> appList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_list': appList,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppListResponse copyWith({
    List<Map<String, dynamic>> appList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppListResponse(
        appList: appList ?? this.appList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
