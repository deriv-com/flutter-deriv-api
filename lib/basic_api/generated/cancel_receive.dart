/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cancel_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Cancel response class.
class CancelResponse extends Response {
  /// Initialize CancelResponse.
  const CancelResponse({
    this.cancel,
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
  factory CancelResponse.fromJson(Map<String, dynamic> json) => CancelResponse(
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
  CancelResponse copyWith({
    Map<String, dynamic>? cancel,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CancelResponse(
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
