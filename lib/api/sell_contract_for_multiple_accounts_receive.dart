/// Autogenerated from flutter_deriv_api|lib/api/sell_contract_for_multiple_accounts_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sell_contract_for_multiple_accounts_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellContractForMultipleAccountsResponse {
  SellContractForMultipleAccountsResponse();
  factory SellContractForMultipleAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SellContractForMultipleAccountsResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SellContractForMultipleAccountsResponseToJson(this);

  // Properties
  Map<String, dynamic> sellContractForMultipleAccounts;

  /// Status information for each affected account.
  Map<String, dynamic> echoReq;

  /// Echo of the request made.
  String msgType;

  /// Action name of the request made.
  int reqId;

  /// Optional field sent in request to map to response, present only when request contains req_id.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
