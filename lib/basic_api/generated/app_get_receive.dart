/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_get_receive.json

import '../response.dart';

/// AppGetResponse class
class AppGetResponse extends Response {
  /// Initialize AppGetResponse
  const AppGetResponse({
    this.appGet,
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
  factory AppGetResponse.fromJson(Map<String, dynamic> json) => AppGetResponse(
        // ignore: avoid_as
        appGet: json['app_get'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// The information of the requested application.
  final Map<String, dynamic> appGet;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_get': appGet,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppGetResponse copyWith({
    Map<String, dynamic> appGet,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppGetResponse(
        appGet: appGet ?? this.appGet,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
