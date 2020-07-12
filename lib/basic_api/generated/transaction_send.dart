/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transaction_send.json

import '../request.dart';

/// TransactionRequest class
class TransactionRequest extends Request {
  /// Initialize TransactionRequest
  const TransactionRequest({
    this.subscribe,
    this.transaction = 1,
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
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
        // ignore: avoid_as
        transaction: json['transaction'] as int,
      );

  /// If set to 1, will send updates whenever there is an update to transactions. If not to 1 then it will not return any records.
  final int subscribe;

  /// Must be `1`
  final int transaction;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'subscribe': subscribe,
        'transaction': transaction,
      };

  /// Creates a copy of instance with given parameters
  @override
  TransactionRequest copyWith({
    int subscribe,
    int transaction,
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
