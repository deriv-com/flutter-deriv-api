/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_contract_for_multiple_accounts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Buy contract for multiple accounts request class.
class BuyContractForMultipleAccountsRequest extends Request {
  /// Initialize BuyContractForMultipleAccountsRequest.
  const BuyContractForMultipleAccountsRequest({
    required this.buyContractForMultipleAccounts,
    this.loginid,
    this.parameters,
    required this.price,
    required this.tokens,
    super.msgType = 'buy_contract_for_multiple_accounts',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory BuyContractForMultipleAccountsRequest.fromJson(
          Map<String, dynamic> json) =>
      BuyContractForMultipleAccountsRequest(
        buyContractForMultipleAccounts:
            json['buy_contract_for_multiple_accounts'] as String?,
        loginid: json['loginid'] as String?,
        parameters: json['parameters'] as Map<String, dynamic>?,
        price: json['price'] as num?,
        tokens: (json['tokens'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Either the ID received from a Price Proposal (`proposal` call), or `1` if contract buy parameters are passed in the `parameters` field.
  final String? buyContractForMultipleAccounts;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Used to pass the parameters for contract buy.
  final Map<String, dynamic>? parameters;

  /// Maximum price at which to purchase the contract.
  final num? price;

  /// List of API tokens identifying the accounts for which the contract is bought. Note: If the same token appears multiple times or if multiple tokens designate the same account, the contract is bought multiple times for this account.
  final List<String>? tokens;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buy_contract_for_multiple_accounts': buyContractForMultipleAccounts,
        'loginid': loginid,
        'parameters': parameters,
        'price': price,
        'tokens': tokens,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  BuyContractForMultipleAccountsRequest copyWith({
    String? buyContractForMultipleAccounts,
    String? loginid,
    Map<String, dynamic>? parameters,
    num? price,
    List<String>? tokens,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      BuyContractForMultipleAccountsRequest(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
        loginid: loginid ?? this.loginid,
        parameters: parameters ?? this.parameters,
        price: price ?? this.price,
        tokens: tokens ?? this.tokens,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
