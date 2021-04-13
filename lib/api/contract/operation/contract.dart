import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/open_contract.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import 'cancel_contract.dart';
import 'exceptions/contract_operations_exception.dart';
import 'sell_contract.dart';
import 'update_contract.dart';

/// Contract class
class Contract extends ContractModel {
  /// Initializes
  Contract({
    double? balanceAfter,
    double? buyPrice,
    int? contractId,
    DateTime? dateStart,
    String? longCode,
    double? payout,
    DateTime? purchaseTime,
    String? shortCode,
    int? transactionId,
    this.subscriptionInformation,
  }) : super(
          balanceAfter: balanceAfter,
          buyPrice: buyPrice,
          contractId: contractId,
          dateStart: dateStart,
          longCode: longCode,
          payout: payout,
          purchaseTime: purchaseTime,
          shortCode: shortCode,
          transactionId: transactionId,
        );

  /// Generates an instance from JSON
  factory Contract.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic>? subscriptionJson,
  }) =>
      Contract(
        balanceAfter: json['balanceAfter']?.toDouble(),
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        dateStart: json['start_time'] == null
            ? getDateTime(json['date_start'])
            : getDateTime(json['start_time']),
        longCode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: getDateTime(json['purchase_time']),
        shortCode: json['shortcode'],
        transactionId: json['transaction_id'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Subscription information
  final SubscriptionModel? subscriptionInformation;

  /// Buys a contract with parameters specified in given [BuyRequest]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<Contract> buy(BuyRequest request) async {
    final BuyResponse response = await _api!.call<BuyResponse>(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return Contract.fromJson(response.buy);
  }

  /// Buys contract with parameters specified in request and subscribes to it.
  ///
  /// Throws a [ContractOperationException] is API response contains an error
  static Stream<Contract?> buyAndSubscribe(
    BuyRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api!
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<Contract?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                ContractOperationException(
                    baseExceptionModel: baseExceptionModel),
          );

          return response is BuyResponse
              ? Contract.fromJson(response.buy)
              : response is ProposalOpenContractResponse
                  ? OpenContract.fromJson(
                      response.proposalOpenContract,
                      subscriptionJson: response.subscription,
                    )
                  : null;
        },
      );

  /// Gets the current spot of the this bought contract as [Contract].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<OpenContract> fetchState() => OpenContract.fetchContractState(
        ProposalOpenContractRequest(
          contractId: contractId!,
        ),
      );

  /// Subscribes to this bought contract spot and returns its spot update as [ContractBaseModel].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Stream<OpenContract?> subscribeState({
    RequestCompareFunction? comparePredicate,
  }) =>
      OpenContract.subscribeContractState(
        ProposalOpenContractRequest(contractId: contractId!),
        comparePredicate: comparePredicate,
      );

  /// Sells this contract.
  ///
  /// [price] is the Minimum price at which to sell the contract,
  /// Default be 0 for 'sell at market'.
  /// Throws a [ContractOperationException] if API response contains an error
  Future<SellContract> sell({double price = 0}) =>
      SellContract.sellContract(SellRequest(sell: contractId!, price: price));

  /// Cancels this contract
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<CancelContract> cancel() =>
      CancelContract.cancelContract(CancelRequest(cancel: contractId!));

  /// Updates this contract
  ///
  /// New [stopLoss] value for a contract. To cancel, pass null.
  /// New [takeProfit] value for a contract. To cancel, pass null.
  /// Throws a [ContractOperationException] if API response contains an error
  Future<UpdateContract> update({
    double? stopLoss,
    double? takeProfit,
  }) =>
      UpdateContract.updateContract(ContractUpdateRequest(
        contractId: contractId!,
        limitOrder: <String, dynamic>{
          'stop_loss': stopLoss,
          'take_profit': takeProfit,
        },
      ));

  /// Generates a copy of instance with given parameters
  Contract copyWith({
    double? balanceAfter,
    double? buyPrice,
    int? contractId,
    DateTime? dateStart,
    String? longCode,
    double? payout,
    DateTime? purchaseTime,
    String? shortCode,
    int? transactionId,
    SubscriptionModel? subscriptionInformation,
  }) =>
      Contract(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        dateStart: dateStart ?? this.dateStart,
        longCode: longCode ?? this.longCode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortCode: shortCode ?? this.shortCode,
        transactionId: transactionId ?? this.transactionId,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
