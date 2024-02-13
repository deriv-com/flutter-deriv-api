/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_withdrawal_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Mt5 withdrawal receive class.
class Mt5WithdrawalReceive extends Response {
  /// Initialize Mt5WithdrawalReceive.
  const Mt5WithdrawalReceive({
    this.binaryTransactionId,
    this.mt5Withdrawal,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5WithdrawalReceive.fromJson(Map<String, dynamic> json) =>
      Mt5WithdrawalReceive(
        binaryTransactionId: json['binary_transaction_id'] as int?,
        mt5Withdrawal: json['mt5_withdrawal'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Deposit reference ID of Binary account.
  final int? binaryTransactionId;

  /// `1` on success
  final int? mt5Withdrawal;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'binary_transaction_id': binaryTransactionId,
        'mt5_withdrawal': mt5Withdrawal,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5WithdrawalReceive copyWith({
    int? binaryTransactionId,
    int? mt5Withdrawal,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5WithdrawalReceive(
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
