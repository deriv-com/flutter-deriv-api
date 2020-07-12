/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_deposit_receive.json

import '../response.dart';

/// Mt5DepositResponse class
class Mt5DepositResponse extends Response {
  /// Initialize Mt5DepositResponse
  const Mt5DepositResponse({
    this.binaryTransactionId,
    this.mt5Deposit,
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
  factory Mt5DepositResponse.fromJson(Map<String, dynamic> json) =>
      Mt5DepositResponse(
        // ignore: avoid_as
        binaryTransactionId: json['binary_transaction_id'] as int,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        mt5Deposit: json['mt5_deposit'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Withdrawal reference ID of Binary account
  final int binaryTransactionId;

  /// 1 on success
  final int mt5Deposit;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'binary_transaction_id': binaryTransactionId,
        'echo_req': echoReq,
        'msg_type': msgType,
        'mt5_deposit': mt5Deposit,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5DepositResponse copyWith({
    int binaryTransactionId,
    int mt5Deposit,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5DepositResponse(
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
