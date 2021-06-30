/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_all_receive.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Forget all response class.
class ForgetAllResponse extends Response {
  /// Initialize ForgetAllResponse.
  const ForgetAllResponse({
    this.forgetAll,
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
  factory ForgetAllResponse.fromJson(Map<String, dynamic> json) =>
      ForgetAllResponse(
        forgetAll: json['forget_all'] as List<dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// IDs of the cancelled streams
  final List<dynamic>? forgetAll;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'forget_all': forgetAll,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetAllResponse copyWith({
    List<dynamic>? forgetAll,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ForgetAllResponse(
        forgetAll: forgetAll ?? this.forgetAll,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
