/// generated automatically from flutter_deriv_api|lib/api/mt5_deposit_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_deposit_receive.g.dart';

/// JSON conversion for 'mt5_deposit_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5DepositResponse extends Response {
  /// Initialize Mt5DepositResponse
  const Mt5DepositResponse({
    this.binaryTransactionId,
    this.mt5Deposit,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory Mt5DepositResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5DepositResponseFromJson(json);

  // Properties
  /// Withdrawal reference ID of Binary account
  final int binaryTransactionId;

  /// 1 on success
  final int mt5Deposit;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5DepositResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5DepositResponse copyWith({
    int binaryTransactionId,
    int mt5Deposit,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Mt5DepositResponse(
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
