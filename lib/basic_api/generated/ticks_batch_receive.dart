/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_batch_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Ticks batch receive class.
class TicksBatchReceive extends Response {
  /// Initialize TicksBatchReceive.
  const TicksBatchReceive({
    this.subscription,
    this.ticksBatch,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TicksBatchReceive.fromJson(Map<String, dynamic> json) =>
      TicksBatchReceive(
        subscription: json['subscription'] as Map<String, dynamic>?,
        ticksBatch: (json['ticks_batch'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Tick by tick list of streamed data for a group of symbols
  final List<Map<String, dynamic>>? ticksBatch;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscription': subscription,
        'ticks_batch': ticksBatch,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksBatchReceive copyWith({
    Map<String, dynamic>? subscription,
    List<Map<String, dynamic>>? ticksBatch,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TicksBatchReceive(
        subscription: subscription ?? this.subscription,
        ticksBatch: ticksBatch ?? this.ticksBatch,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
