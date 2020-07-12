/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_contract_for_multiple_accounts_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// SellContractForMultipleAccountsRequest class
class SellContractForMultipleAccountsRequest extends Request {
  /// Initialize SellContractForMultipleAccountsRequest
  const SellContractForMultipleAccountsRequest({
    @required this.price,
    this.sellContractForMultipleAccounts = true,
    @required this.shortcode,
    @required this.tokens,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'sell_contract_for_multiple_accounts',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SellContractForMultipleAccountsRequest.fromJson(
          Map<String, dynamic> json) =>
      SellContractForMultipleAccountsRequest(
        passthrough: json['passthrough'] as Map<String, dynamic>,
        price: json['price'] as num,
        reqId: json['req_id'] as int,
        sellContractForMultipleAccounts:
            json['sell_contract_for_multiple_accounts'] == null
                ? null
                : json['sell_contract_for_multiple_accounts'] == 1,
        shortcode: json['shortcode'] as String,
        tokens: (json['tokens'] as List)
            ?.map((dynamic item) => item as String)
            ?.toList(),
      );

  /// Minimum price at which to sell the contract, or `0` for 'sell at market'.
  final num price;

  /// Must be `true`
  final bool sellContractForMultipleAccounts;

  /// An internal ID used to identify the contract which was originally bought. This is returned from the `buy` and `buy_contract_for_multiple_accounts` calls.
  final String shortcode;

  /// Authorisation tokens which select the accounts to sell use for the affected accounts.
  final List<String> tokens;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'price': price,
        'req_id': reqId,
        'sell_contract_for_multiple_accounts':
            sellContractForMultipleAccounts == null
                ? null
                : sellContractForMultipleAccounts ? 1 : 0,
        'shortcode': shortcode,
        'tokens': tokens,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellContractForMultipleAccountsRequest copyWith({
    num price,
    bool sellContractForMultipleAccounts,
    String shortcode,
    List<String> tokens,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      SellContractForMultipleAccountsRequest(
        price: price ?? this.price,
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
        shortcode: shortcode ?? this.shortcode,
        tokens: tokens ?? this.tokens,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
