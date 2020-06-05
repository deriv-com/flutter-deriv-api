/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_contract_for_multiple_accounts_send.json
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../request.dart';

part 'buy_contract_for_multiple_accounts_send.g.dart';

/// JSON conversion for 'buy_contract_for_multiple_accounts_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class BuyContractForMultipleAccountsRequest extends Request {
  /// Initialize BuyContractForMultipleAccountsRequest
  const BuyContractForMultipleAccountsRequest({
    @required this.buyContractForMultipleAccounts,
    this.parameters,
    @required this.price,
    @required this.tokens,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'buy_contract_for_multiple_accounts',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory BuyContractForMultipleAccountsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$BuyContractForMultipleAccountsRequestFromJson(json);

  /// Either the ID received from a Price Proposal (`proposal` call), or `1` if contract buy parameters are passed in the `parameters` field.
  final String buyContractForMultipleAccounts;

  /// [Optional] Used to pass the parameters for contract buy.
  final Map<String, dynamic> parameters;

  /// Maximum price at which to purchase the contract.
  final num price;

  /// List of API tokens identifying the accounts for which the contract is bought. Note: If the same token appears multiple times or if multiple tokens designate the same account, the contract is bought multiple times for this account.
  final List<String> tokens;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() =>
      _$BuyContractForMultipleAccountsRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  BuyContractForMultipleAccountsRequest copyWith({
    String buyContractForMultipleAccounts,
    Map<String, dynamic> parameters,
    num price,
    List<String> tokens,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      BuyContractForMultipleAccountsRequest(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
        parameters: parameters ?? this.parameters,
        price: price ?? this.price,
        tokens: tokens ?? this.tokens,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
