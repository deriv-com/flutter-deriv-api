/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_contract_for_multiple_accounts_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// SellContractForMultipleAccountsRequest class
class SellContractForMultipleAccountsRequest extends Request {
  /// Initialize SellContractForMultipleAccountsRequest
  const SellContractForMultipleAccountsRequest({
    @required this.price,
    this.sellContractForMultipleAccounts = 1,
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
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        price: json['price'] as num,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        sellContractForMultipleAccounts:
            json['sell_contract_for_multiple_accounts'] as int,
        // ignore: avoid_as
        shortcode: json['shortcode'] as String,
        // ignore: avoid_as, always_specify_types
        tokens: (json['tokens'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as String)
            ?.toList(),
      );

  /// Minimum price at which to sell the contract, or `0` for 'sell at market'.
  final num price;

  /// Must be `1`
  final int sellContractForMultipleAccounts;

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
        'sell_contract_for_multiple_accounts': sellContractForMultipleAccounts,
        'shortcode': shortcode,
        'tokens': tokens,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellContractForMultipleAccountsRequest copyWith({
    num price,
    int sellContractForMultipleAccounts,
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
