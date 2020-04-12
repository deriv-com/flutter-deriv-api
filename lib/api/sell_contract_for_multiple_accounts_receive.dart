/// generated automatically from flutter_deriv_api|lib/api/sell_contract_for_multiple_accounts_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'sell_contract_for_multiple_accounts_receive.g.dart';

/// JSON conversion for 'sell_contract_for_multiple_accounts_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellContractForMultipleAccountsResponse extends Response {
  /// Initialize SellContractForMultipleAccountsResponse
  SellContractForMultipleAccountsResponse({
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
}
