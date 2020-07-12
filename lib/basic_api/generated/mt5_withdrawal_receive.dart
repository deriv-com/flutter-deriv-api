/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_withdrawal_receive.json

import '../response.dart';

/// Mt5WithdrawalResponse class
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

  /// Creates an instance from JSON
  factory Mt5WithdrawalResponse.fromJson(Map<String, dynamic> json) =>
      Mt5WithdrawalResponse(
        // ignore: avoid_as
        binaryTransactionId: json['binary_transaction_id'] as int,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        mt5Withdrawal: json['mt5_withdrawal'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Deposit reference ID of Binary account.
  final int binaryTransactionId;

  /// `1` on success
  final int mt5Withdrawal;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'binary_transaction_id': binaryTransactionId,
        'echo_req': echoReq,
        'msg_type': msgType,
        'mt5_withdrawal': mt5Withdrawal,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
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
