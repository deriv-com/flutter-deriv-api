/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_limits_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Get limits receive class.
class GetLimitsReceive extends Response {
  /// Initialize GetLimitsReceive.
  const GetLimitsReceive({
    this.getLimits,
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
  factory GetLimitsReceive.fromJson(Map<String, dynamic> json) =>
      GetLimitsReceive(
        getLimits: json['get_limits'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Trading limits of real account user
  final Map<String, dynamic>? getLimits;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_limits': getLimits,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetLimitsReceive copyWith({
    Map<String, dynamic>? getLimits,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      GetLimitsReceive(
        getLimits: getLimits ?? this.getLimits,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
