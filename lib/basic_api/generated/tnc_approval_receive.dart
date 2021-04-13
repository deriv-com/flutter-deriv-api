/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/tnc_approval_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Tnc approval response class
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
        tncApproval: json['tnc_approval'] as int,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Set terms and conditions 1: success
  final int? tncApproval;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'tnc_approval': tncApproval,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TncApprovalResponse copyWith({
    int? tncApproval,
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
  List<Object> get props => <Object>[];
}
