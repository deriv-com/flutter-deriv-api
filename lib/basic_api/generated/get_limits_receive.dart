/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_limits_receive.json

import '../response.dart';

/// GetLimitsResponse class
class GetLimitsResponse extends Response {
  /// Initialize GetLimitsResponse
  const GetLimitsResponse({
    this.getLimits,
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
  factory GetLimitsResponse.fromJson(Map<String, dynamic> json) =>
      GetLimitsResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        getLimits: json['get_limits'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Trading limits of real account user
  final Map<String, dynamic> getLimits;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'get_limits': getLimits,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetLimitsResponse copyWith({
    Map<String, dynamic> getLimits,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetLimitsResponse(
        getLimits: getLimits ?? this.getLimits,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
