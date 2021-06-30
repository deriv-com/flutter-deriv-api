/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_start_receive.json.

import '../response.dart';

/// Copy start response class.
class CopyStartResponse extends Response {
  /// Initialize CopyStartResponse.
  const CopyStartResponse({
    this.copyStart,
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
  factory CopyStartResponse.fromJson(Map<String, dynamic> json) =>
      CopyStartResponse(
        copyStart: json['copy_start'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Copy start confirmation. Returns 1 is success.
  final int? copyStart;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copy_start': copyStart,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStartResponse copyWith({
    int? copyStart,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CopyStartResponse(
        copyStart: copyStart ?? this.copyStart,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
