/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_batch_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Ticks batch request class.
class TicksBatchRequest extends Request {
  /// Initialize TicksBatchRequest.
  const TicksBatchRequest({
    required this.market,
    this.subscribe,
    this.ticksBatch = true,
    super.msgType = 'ticks_batch',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TicksBatchRequest.fromJson(Map<String, dynamic> json) =>
      TicksBatchRequest(
        market: json['market'] as String?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        ticksBatch:
            json['ticks_batch'] == null ? null : json['ticks_batch'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The short market name.
  final String? market;

  /// [Optional] If set to `true`, will send updates in batches by market.
  final bool? subscribe;

  /// Must be `true`
  final bool? ticksBatch;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'market': market,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'ticks_batch': ticksBatch == null
            ? null
            : ticksBatch!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksBatchRequest copyWith({
    String? market,
    bool? subscribe,
    bool? ticksBatch,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TicksBatchRequest(
        market: market ?? this.market,
        subscribe: subscribe ?? this.subscribe,
        ticksBatch: ticksBatch ?? this.ticksBatch,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[market];
}
