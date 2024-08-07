/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_withdrawal_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Mt5 withdrawal request class.
class Mt5WithdrawalRequest extends Request {
  /// Initialize Mt5WithdrawalRequest.
  const Mt5WithdrawalRequest({
    required this.amount,
    required this.fromMt5,
    this.loginid,
    this.mt5Withdrawal = true,
    required this.toBinary,
    super.msgType = 'mt5_withdrawal',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5WithdrawalRequest.fromJson(Map<String, dynamic> json) =>
      Mt5WithdrawalRequest(
        amount: json['amount'] as num?,
        fromMt5: json['from_mt5'] as String?,
        loginid: json['loginid'] as String?,
        mt5Withdrawal:
            json['mt5_withdrawal'] == null ? null : json['mt5_withdrawal'] == 1,
        toBinary: json['to_binary'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Amount to withdraw (in the currency of the MT5 account); min = $1 or an equivalent amount, max = $20000 or an equivalent amount.
  final num? amount;

  /// MT5 account login to withdraw money from
  final String? fromMt5;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? mt5Withdrawal;

  /// Binary account loginid to transfer money to
  final String? toBinary;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'from_mt5': fromMt5,
        'loginid': loginid,
        'mt5_withdrawal': mt5Withdrawal == null
            ? null
            : mt5Withdrawal!
                ? 1
                : 0,
        'to_binary': toBinary,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5WithdrawalRequest copyWith({
    num? amount,
    String? fromMt5,
    String? loginid,
    bool? mt5Withdrawal,
    String? toBinary,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5WithdrawalRequest(
        amount: amount ?? this.amount,
        fromMt5: fromMt5 ?? this.fromMt5,
        loginid: loginid ?? this.loginid,
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        toBinary: toBinary ?? this.toBinary,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
