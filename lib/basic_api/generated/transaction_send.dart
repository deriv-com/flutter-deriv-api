/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transaction_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// Transaction request class
class TransactionRequest extends Request {
  /// Initialize TransactionRequest
  const TransactionRequest({
    this.subscribe,
    this.transaction = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'transaction',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      TransactionRequest(
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        transaction:
            json['transaction'] == null ? null : json['transaction'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// If set to 1, will send updates whenever there is an update to transactions. If not to 1 then it will not return any records.
  final bool subscribe;

  /// Must be `true`
  final bool transaction;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscribe': subscribe == null ? null : subscribe ? 1 : 0,
        'transaction': transaction == null ? null : transaction ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TransactionRequest copyWith({
    bool subscribe,
    bool transaction,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TransactionRequest(
        subscribe: subscribe ?? this.subscribe,
        transaction: transaction ?? this.transaction,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
