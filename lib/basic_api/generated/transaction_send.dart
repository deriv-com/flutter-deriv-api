/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transaction_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Transaction request class.
class TransactionRequest extends Request {
  /// Initialize TransactionRequest.
  const TransactionRequest({
    this.loginid,
    this.subscribe,
    this.transaction = true,
    super.msgType = 'transaction',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      TransactionRequest(
        loginid: json['loginid'] as String?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        transaction:
            json['transaction'] == null ? null : json['transaction'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// If set to `true`, will send updates whenever there is an update to transactions. If not to `true` then it will not return any records.
  final bool? subscribe;

  /// Must be `true`
  final bool? transaction;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
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
  TransactionRequest copyWith({
    String? loginid,
    bool? subscribe,
    bool? transaction,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TransactionRequest(
        loginid: loginid ?? this.loginid,
        subscribe: subscribe ?? this.subscribe,
        transaction: transaction ?? this.transaction,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
