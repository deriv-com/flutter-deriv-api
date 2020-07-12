/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_all_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Forget all response class
class ForgetAllResponse extends Response {
  /// Initialize ForgetAllResponse
  const ForgetAllResponse({
    this.forgetAll,
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
  factory ForgetAllResponse.fromJson(Map<String, dynamic> json) =>
      ForgetAllResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        forgetAll: (json['forget_all'] as List)
            ?.map((dynamic item) => item as dynamic)
            ?.toList(),
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// IDs of the cancelled streams
  final List<dynamic> forgetAll;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'forget_all': forgetAll,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetAllResponse copyWith({
    List<dynamic> forgetAll,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ForgetAllResponse(
        forgetAll: forgetAll ?? this.forgetAll,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
