/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_deposit_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Mt5 deposit request class.
class Mt5DepositRequest extends Request {
  /// Initialize Mt5DepositRequest.
  const Mt5DepositRequest({
    required this.amount,
    required this.fromBinary,
    this.loginid,
    this.mt5Deposit = true,
    required this.toMt5,
    super.msgType = 'mt5_deposit',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5DepositRequest.fromJson(Map<String, dynamic> json) =>
      Mt5DepositRequest(
        amount: json['amount'] as num?,
        fromBinary: json['from_binary'] as String?,
        loginid: json['loginid'] as String?,
        mt5Deposit:
            json['mt5_deposit'] == null ? null : json['mt5_deposit'] == 1,
        toMt5: json['to_mt5'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Amount to deposit (in the currency of from_binary); min = $1 or an equivalent amount, max = $20000 or an equivalent amount
  final num? amount;

  /// Binary account loginid to transfer money from
  final String? fromBinary;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? mt5Deposit;

  /// MT5 account login to deposit money to
  final String? toMt5;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'from_binary': fromBinary,
        'loginid': loginid,
        'mt5_deposit': mt5Deposit == null
            ? null
            : mt5Deposit!
                ? 1
                : 0,
        'to_mt5': toMt5,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5DepositRequest copyWith({
    num? amount,
    String? fromBinary,
    String? loginid,
    bool? mt5Deposit,
    String? toMt5,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5DepositRequest(
        amount: amount ?? this.amount,
        fromBinary: fromBinary ?? this.fromBinary,
        loginid: loginid ?? this.loginid,
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        toMt5: toMt5 ?? this.toMt5,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
