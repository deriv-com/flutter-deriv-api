/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_contract_for_multiple_accounts_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'buy_contract_for_multiple_accounts_receive.g.dart';

/// JSON conversion for 'buy_contract_for_multiple_accounts_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BuyContractForMultipleAccountsResponse extends Response {
  /// Initialize BuyContractForMultipleAccountsResponse
  const BuyContractForMultipleAccountsResponse({
    this.buyContractForMultipleAccounts,
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
  factory BuyContractForMultipleAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BuyContractForMultipleAccountsResponseFromJson(json);

  /// Receipt confirmation for the purchase
  final Map<String, dynamic> buyContractForMultipleAccounts;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() =>
      _$BuyContractForMultipleAccountsResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  BuyContractForMultipleAccountsResponse copyWith({
    Map<String, dynamic> buyContractForMultipleAccounts,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      BuyContractForMultipleAccountsResponse(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
