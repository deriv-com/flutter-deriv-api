import 'package:flutter_deriv_api/api/contract/models/buy_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/models/open_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Buy class
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
  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

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
