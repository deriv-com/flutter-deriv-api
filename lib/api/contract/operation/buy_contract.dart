import 'package:flutter_deriv_api/api/contract/models/buy_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/models/open_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/sell_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/update_contract.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/contract_operations_exception.dart';

/// Result of a buy contract operation
class BuyContract extends BuyContractModel {
  /// Initializes
  BuyContract({
    double balanceAfter,
    double buyPrice,
    int contractId,
    String longCode,
    double payout,
    DateTime purchaseTime,
    String shortCode,
    DateTime startTime,
    int transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          buyPrice: buyPrice,
          contractId: contractId,
          longCode: longCode,
          payout: payout,
          purchaseTime: purchaseTime,
          shortCode: shortCode,
          startTime: startTime,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory BuyContract.fromJson(Map<String, dynamic> json) => BuyContract(
        balanceAfter: json['balance_after'],
        buyPrice: json['buy_price'],
        contractId: json['contract_id'],
        longCode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: getDateTime(json['purchase_time']),
        shortCode: json['shortcode'],
        startTime: getDateTime(json['start_time']),
        transactionId: json['transaction_id'],
      );

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Buys a contract with given [BuyRequest]
  static Future<BuyContract> buy(BuyRequest request) async {
    final BuyResponse buyResponse = await _api.call(
      request: request,
    );

    if (buyResponse.error != null) {
      throw ContractOperationException(message: buyResponse.error['message']);
    }

    return BuyContract.fromJson(buyResponse.buy);
  }

  /// Get the current spot of the this bought contract
  Future<OpenContractModel> getCurrentContractState() async {
    final ProposalOpenContractResponse openContractResponse = await _api.call(
      request: ProposalOpenContractRequest(
        contractId: contractId,
      ),
    );

    if (openContractResponse.error != null) {
      throw ContractOperationException(
        message: openContractResponse.error['message'],
      );
    }

    return OpenContractModel.fromJson(
      openContractResponse.proposalOpenContract,
    );
  }

  /// Subscribes to bought contract spot and return its spot update as [OpenContractModel]
  Stream<OpenContractModel> getContractStateUpdate() => _api
          .subscribe(
        request: ProposalOpenContractRequest(
          contractId: contractId,
        ),
      )
          .map<OpenContractModel>(
        (Response response) {
          if (response.error != null) {
            throw ContractOperationException(
                message: response.error['message']);
          }
          final ProposalOpenContractResponse openContractResponse = response;
          return OpenContractModel.fromJson(
              openContractResponse.proposalOpenContract);
        },
      );

  /// Sell this contract
  Future<SellContract> sell() async {
    final Response response =
        await _api.call(request: SellRequest(sell: contractId));

    if (response.error != null) {
      throw ContractOperationException(message: response.error['message']);
    }

    final SellResponse sellResponse = response;
    return SellContract.fromJson(sellResponse.sell);
  }

  /// update this contract with given [stopLoss], [takeProfit]
  Future<UpdateContract> update({
    double stopLoss,
    double takeProfit,
  }) async {
    final Response response = await _api.call(
      request: ContractUpdateRequest(
        contractId: contractId,
        limitOrder: <String, dynamic>{
          'stop_loss': stopLoss,
          'take_profit': takeProfit,
        },
      ),
    );

    if (response.error != null) {
      throw ContractOperationException(message: response.error['message']);
    }

    final ContractUpdateResponse updateResponse = response;
    return UpdateContract.fromJson(updateResponse.contractUpdate);
  }

  /// Creates a copy of instance with given parameters
  BuyContractModel copyWith({
    double balanceAfter,
    double buyPrice,
    int contractId,
    String longCode,
    double payout,
    DateTime purchaseTime,
    String shortCode,
    DateTime startTime,
    int transactionId,
  }) =>
      BuyContract(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        longCode: longCode ?? this.longCode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortCode: shortCode ?? this.shortCode,
        startTime: startTime ?? this.startTime,
        transactionId: transactionId ?? this.transactionId,
      );
}
