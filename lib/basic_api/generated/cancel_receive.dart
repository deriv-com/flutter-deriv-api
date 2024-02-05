/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cancel_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Cancel receive class.
class CancelReceive extends Response {
  /// Initialize CancelReceive.
  const CancelReceive({
    this.cancel,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CancelReceive.fromJson(Map<String, dynamic> json) => CancelReceive(
        cancel: json['cancel'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Receipt for the transaction
  final Map<String, dynamic>? cancel;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cancel': cancel,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CancelReceive copyWith({
    Map<String, dynamic>? cancel,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CancelReceive(
        cancel: cancel ?? this.cancel,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
