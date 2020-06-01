/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_withdrawal_send.json
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../request.dart';

part 'mt5_withdrawal_send.g.dart';

/// JSON conversion for 'mt5_withdrawal_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class Mt5WithdrawalRequest extends Request {
  /// Initialize Mt5WithdrawalRequest
  const Mt5WithdrawalRequest({
    @required this.amount,
    @required this.fromMt5,
    this.mt5Withdrawal = 1,
    @required this.toBinary,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'mt5_withdrawal',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5WithdrawalRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5WithdrawalRequestFromJson(json);

  /// Amount to withdraw (in the currency of the MT5 account); min = $1 or an equivalent amount, max = $20000 or an equivalent amount.
  final num amount;

  /// MT5 account login to withdraw money from
  final String fromMt5;

  /// Must be `1`
  final int mt5Withdrawal;

  /// Binary account loginid to transfer money to
  final String toBinary;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5WithdrawalRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5WithdrawalRequest copyWith({
    num amount,
    String fromMt5,
    int mt5Withdrawal,
    String toBinary,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5WithdrawalRequest(
        amount: amount ?? this.amount,
        fromMt5: fromMt5 ?? this.fromMt5,
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        toBinary: toBinary ?? this.toBinary,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
