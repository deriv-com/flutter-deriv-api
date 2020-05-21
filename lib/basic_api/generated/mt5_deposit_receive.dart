/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_deposit_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'mt5_deposit_receive.g.dart';

/// JSON conversion for 'mt5_deposit_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
      _$Mt5DepositResponseFromJson(json);

  /// Withdrawal reference ID of Binary account
  final int binaryTransactionId;

  /// 1 on success
  final int mt5Deposit;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5DepositResponseToJson(this);

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
