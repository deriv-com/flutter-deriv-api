/// generated automatically from flutter_deriv_api|lib/api/sell_contract_for_multiple_accounts_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'sell_contract_for_multiple_accounts_receive.g.dart';

/// JSON conversion for 'sell_contract_for_multiple_accounts_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellContractForMultipleAccountsResponse extends Response {
  /// Initialize SellContractForMultipleAccountsResponse
  const SellContractForMultipleAccountsResponse({
    this.sellContractForMultipleAccounts,
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
  factory SellContractForMultipleAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SellContractForMultipleAccountsResponseFromJson(json);

  // Properties
  /// Status information for each affected account.
  final Map<String, dynamic> sellContractForMultipleAccounts;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() =>
      _$SellContractForMultipleAccountsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SellContractForMultipleAccountsResponse copyWith({
    Map<String, dynamic> sellContractForMultipleAccounts,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SellContractForMultipleAccountsResponse(
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
