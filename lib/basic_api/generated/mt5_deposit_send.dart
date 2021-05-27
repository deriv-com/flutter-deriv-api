/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_deposit_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Mt5 deposit request class
class Mt5DepositRequest extends Request {
  /// Initialize Mt5DepositRequest
  const Mt5DepositRequest({
    @required this.amount,
    @required this.fromBinary,
    this.mt5Deposit = true,
    @required this.toMt5,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'mt5_deposit',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5DepositRequest.fromJson(Map<String, dynamic> json) =>
      Mt5DepositRequest(
        amount: json['amount'] as num,
        fromBinary: json['from_binary'] as String,
        mt5Deposit:
            json['mt5_deposit'] == null ? null : json['mt5_deposit'] == 1,
        toMt5: json['to_mt5'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Amount to deposit (in the currency of from_binary); min = $1 or an equivalent amount, max = $20000 or an equivalent amount
  final num amount;

  /// Binary account loginid to transfer money from
  final String fromBinary;

  /// Must be `true`
  final bool mt5Deposit;

  /// MT5 account login to deposit money to
  final String toMt5;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'from_binary': fromBinary,
        'mt5_deposit': mt5Deposit == null
            ? null
            : mt5Deposit
                ? 1
                : 0,
        'to_mt5': toMt5,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5DepositRequest copyWith({
    num amount,
    String fromBinary,
    bool mt5Deposit,
    String toMt5,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5DepositRequest(
        amount: amount ?? this.amount,
        fromBinary: fromBinary ?? this.fromBinary,
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        toMt5: toMt5 ?? this.toMt5,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
