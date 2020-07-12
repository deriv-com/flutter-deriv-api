/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_all_receive.json

import '../response.dart';

/// ForgetAllResponse class
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
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as, always_specify_types
        forgetAll: (json['forget_all'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as dynamic)
            ?.toList(),
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
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
