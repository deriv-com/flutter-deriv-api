/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_deposit_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Mt5 deposit receive class.
class Mt5DepositReceive extends Response {
  /// Initialize Mt5DepositReceive.
  const Mt5DepositReceive({
    this.binaryTransactionId,
    this.mt5Deposit,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5DepositReceive.fromJson(Map<String, dynamic> json) =>
      Mt5DepositReceive(
        binaryTransactionId: json['binary_transaction_id'] as int?,
        mt5Deposit: json['mt5_deposit'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Withdrawal reference ID of Binary account
  final int? binaryTransactionId;

  /// 1 on success
  final int? mt5Deposit;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'binary_transaction_id': binaryTransactionId,
        'mt5_deposit': mt5Deposit,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5DepositReceive copyWith({
    int? binaryTransactionId,
    int? mt5Deposit,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5DepositReceive(
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
