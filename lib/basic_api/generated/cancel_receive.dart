/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cancel_receive.json

import '../response.dart';

/// CancelResponse class
class CancelResponse extends Response {
  /// Initialize CancelResponse
  const CancelResponse({
    this.cancel,
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
  factory CancelResponse.fromJson(Map<String, dynamic> json) => CancelResponse(
        // ignore: avoid_as
        cancel: json['cancel'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Receipt for the transaction
  final Map<String, dynamic> cancel;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cancel': cancel,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CancelResponse copyWith({
    Map<String, dynamic> cancel,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CancelResponse(
        cancel: cancel ?? this.cancel,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
