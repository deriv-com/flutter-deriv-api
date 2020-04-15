/// generated automatically from flutter_deriv_api|lib/api/mt5_withdrawal_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_withdrawal_receive.g.dart';

/// JSON conversion for 'mt5_withdrawal_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5WithdrawalResponse extends Response {
  /// Initialize Mt5WithdrawalResponse
  const Mt5WithdrawalResponse({
    this.binaryTransactionId,
    this.mt5Withdrawal,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory Mt5WithdrawalResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5WithdrawalResponseFromJson(json);

  // Properties
  /// Deposit reference ID of Binary account.
  final int binaryTransactionId;

  /// `1` on success
  final int mt5Withdrawal;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5WithdrawalResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5WithdrawalResponse copyWith({
    int binaryTransactionId,
    int mt5Withdrawal,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5WithdrawalResponse(
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
