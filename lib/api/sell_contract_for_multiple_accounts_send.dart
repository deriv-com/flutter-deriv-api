/// generated automatically from flutter_deriv_api|lib/api/sell_contract_for_multiple_accounts_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'sell_contract_for_multiple_accounts_send.g.dart';

/// JSON conversion for 'sell_contract_for_multiple_accounts_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellContractForMultipleAccountsRequest extends Request {
  /// Initialize SellContractForMultipleAccountsRequest
  const SellContractForMultipleAccountsRequest({
    this.price,
    this.sellContractForMultipleAccounts = 1,
    this.shortcode,
    this.tokens,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory SellContractForMultipleAccountsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$SellContractForMultipleAccountsRequestFromJson(json);

  // Properties
  /// Minimum price at which to sell the contract, or `0` for 'sell at market'.
  final num price;

  /// Must be `1`
  final int sellContractForMultipleAccounts;

  /// An internal ID used to identify the contract which was originally bought. This is returned from the `buy` and `buy_contract_for_multiple_accounts` calls.
  final String shortcode;

  /// Authorisation tokens which select the accounts to sell use for the affected accounts.
  final List<String> tokens;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() =>
      _$SellContractForMultipleAccountsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SellContractForMultipleAccountsRequest copyWith({
    num price,
    int sellContractForMultipleAccounts,
    String shortcode,
    List<String> tokens,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      SellContractForMultipleAccountsRequest(
        price: price ?? this.price,
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
        shortcode: shortcode ?? this.shortcode,
        tokens: tokens ?? this.tokens,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
