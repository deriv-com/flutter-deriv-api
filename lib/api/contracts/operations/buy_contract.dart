import 'package:flutter_deriv_api/api/models/buy_contract_model.dart';
import 'package:flutter_deriv_api/api/models/open_contract_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/contract_operations_exception.dart';

/// Buy class
class BuyContract extends BuyContractModel {
  /// Class constructor
  BuyContract({
    double balanceAfter,
    double buyPrice,
    int contractId,
    String longcode,
    double payout,
    DateTime purchaseTime,
    String shortcode,
    DateTime startTime,
    int transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          buyPrice: buyPrice,
          contractId: contractId,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          shortcode: shortcode,
          startTime: startTime,
          transactionId: transactionId,
        );

  /// Creates instance from json
  factory BuyContract.fromJson(Map<String, dynamic> json) => BuyContract(
        balanceAfter: json['balance_after'],
        buyPrice: json['buy_price'],
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: json['purchase_time'] == null
            ? null
            : getDateTime(json['purchase_time']),
        shortcode: json['shortcode'],
        startTime:
            json['start_time'] == null ? null : getDateTime(json['start_time']),
        transactionId: json['transaction_id'],
      );

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Get the current spot of the this bought contract
  Future<OpenContractModel> getCurrentContractState() async {
    final ProposalOpenContractResponse openContractResponse = await _api.call(
      request: ProposalOpenContractRequest(
        contractId: contractId,
      ),
    );

    if (openContractResponse.error != null) {
      throw ContractOperationException(
          message: openContractResponse.error['message']);
    }

    return OpenContractModel.fromJson(
        openContractResponse.proposalOpenContract);
  }

  /// Creates copy of instance with given parameters
  BuyContractModel copyWith({
    double balanceAfter,
    double buyPrice,
    int contractId,
    String longcode,
    double payout,
    DateTime purchaseTime,
    String shortcode,
    DateTime startTime,
    int transactionId,
  }) =>
      BuyContract(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortcode: shortcode ?? this.shortcode,
        startTime: startTime ?? this.startTime,
        transactionId: transactionId ?? this.transactionId,
      );
}
