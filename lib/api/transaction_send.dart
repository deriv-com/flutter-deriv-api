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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
}
