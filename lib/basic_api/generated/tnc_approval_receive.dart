/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/tnc_approval_receive.json

import '../response.dart';

/// TncApprovalResponse class
class TncApprovalResponse extends Response {
  /// Initialize TncApprovalResponse
  const TncApprovalResponse({
    this.tncApproval,
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
  factory TncApprovalResponse.fromJson(Map<String, dynamic> json) =>
      TncApprovalResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        tncApproval: json['tnc_approval'] as int,
      );

  /// Set terms and conditions 1: success
  final int tncApproval;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'tnc_approval': tncApproval,
      };

  /// Creates a copy of instance with given parameters
  @override
  TncApprovalResponse copyWith({
    int tncApproval,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TncApprovalResponse(
        tncApproval: tncApproval ?? this.tncApproval,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
