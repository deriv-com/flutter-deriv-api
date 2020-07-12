/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_deposit_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// Mt5DepositRequest class
class Mt5DepositRequest extends Request {
  /// Initialize Mt5DepositRequest
  const Mt5DepositRequest({
    @required this.amount,
    @required this.fromBinary,
    this.mt5Deposit = 1,
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
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as
        fromBinary: json['from_binary'] as String,
        // ignore: avoid_as
        mt5Deposit: json['mt5_deposit'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        toMt5: json['to_mt5'] as String,
      );

  /// Amount to deposit (in the currency of from_binary); min = $1 or an equivalent amount, max = $20000 or an equivalent amount
  final num amount;

  /// Binary account loginid to transfer money from
  final String fromBinary;

  /// Must be `1`
  final int mt5Deposit;

  /// MT5 account login to deposit money to
  final String toMt5;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'from_binary': fromBinary,
        'mt5_deposit': mt5Deposit,
        'passthrough': passthrough,
        'req_id': reqId,
        'to_mt5': toMt5,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5DepositRequest copyWith({
    num amount,
    String fromBinary,
    int mt5Deposit,
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
