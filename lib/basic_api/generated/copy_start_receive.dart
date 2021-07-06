/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_start_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Copy start receive class.
class CopyStartReceive extends Response {
  /// Initialize CopyStartReceive.
  const CopyStartReceive({
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
  factory CopyStartReceive.fromJson(Map<String, dynamic> json) =>
      CopyStartReceive(
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
  CopyStartReceive copyWith({
    int? copyStart,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CopyStartReceive(
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
