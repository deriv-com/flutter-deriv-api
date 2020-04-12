/// generated automatically from flutter_deriv_api|lib/api/transaction_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'transaction_send.g.dart';

/// JSON conversion for 'transaction_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TransactionRequest extends Request {
  /// Initialize TransactionRequest
  TransactionRequest({
    this.subscribe,
    this.transaction = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);

  // Properties
  /// If set to 1, will send updates whenever there is an update to transactions. If not to 1 then it will not return any records.
  final int subscribe;

  /// Must be `1`
  final int transaction;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TransactionRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TransactionRequest copyWith({
    int subscribe,
    int transaction,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      TransactionRequest(
        subscribe: subscribe ?? this.subscribe,
        transaction: transaction ?? this.transaction,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
