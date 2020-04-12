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
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      SellContractForMultipleAccountsResponse(
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
