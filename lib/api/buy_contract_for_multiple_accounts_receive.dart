/// generated automatically from flutter_deriv_api|lib/api/buy_contract_for_multiple_accounts_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'buy_contract_for_multiple_accounts_receive.g.dart';

/// JSON conversion for 'buy_contract_for_multiple_accounts_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BuyContractForMultipleAccountsResponse extends Response {
  /// Initialize BuyContractForMultipleAccountsResponse
  const BuyContractForMultipleAccountsResponse({
    this.buyContractForMultipleAccounts,
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
  factory BuyContractForMultipleAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BuyContractForMultipleAccountsResponseFromJson(json);

  // Properties
  /// Receipt confirmation for the purchase
  final Map<String, dynamic> buyContractForMultipleAccounts;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() =>
      _$BuyContractForMultipleAccountsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  BuyContractForMultipleAccountsResponse copyWith({
    Map<String, dynamic> buyContractForMultipleAccounts,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      BuyContractForMultipleAccountsResponse(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
