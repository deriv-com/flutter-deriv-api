/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transaction_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Transaction send class.
class TransactionSend extends Request {
  /// Initialize TransactionSend.
  const TransactionSend({
    this.subscribe,
    this.transaction = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'transaction',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TransactionSend.fromJson(Map<String, dynamic> json) =>
      TransactionSend(
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        transaction:
            json['transaction'] == null ? null : json['transaction'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// If set to `true`, will send updates whenever there is an update to transactions. If not to `true` then it will not return any records.
  final bool? subscribe;

  /// Must be `true`
  final bool? transaction;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'transaction': transaction == null
            ? null
            : transaction!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TransactionSend copyWith({
    bool? subscribe,
    bool? transaction,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TransactionSend(
        subscribe: subscribe ?? this.subscribe,
        transaction: transaction ?? this.transaction,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
