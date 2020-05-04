import 'package:flutter_deriv_api/api/contracts/operations/buy_contract.dart';
import 'package:flutter_deriv_api/api/contracts/operations/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/api/models/buy_contract_model.dart';
import 'package:flutter_deriv_api/api/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/api/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/models/price_proposal_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Implementation of [PriceProposalModel]
class PriceProposal extends PriceProposalModel {
  /// Initializes
  PriceProposal({
    double askPrice,
    CancellationInfoModel cancellation,
    double commission,
    DateTime dateStart,
    String displayValue,
    String id,
    LimitOrderModel limitOrder,
    String longCode,
    int multiplier,
    double payout,
    double spot,
    DateTime spotTime,
  }) : super(
          askPrice,
          cancellation,
          commission,
          dateStart,
          displayValue,
          id,
          limitOrder,
          longCode,
          multiplier,
          payout,
          spot,
          spotTime,
        );

  /// Generate an instance from json
  factory PriceProposal.fromJson(Map<String, dynamic> json) => PriceProposal(
        askPrice: json['ask_price']?.toDouble(),
        cancellation: getItemFromMap(
          json['cancellation'],
          itemToTypeCallback: (dynamic item) =>
              CancellationInfoModel.fromJson(item),
        ),
        commission: json['commission'],
        dateStart: getDateTime(json['date_start']),
        displayValue: json['display_value'],
        id: json['id'],
        limitOrder: getItemFromMap(
          json['limit_order'],
          itemToTypeCallback: (dynamic item) => LimitOrderModel.fromJson(item),
        ),
        longCode: json['longcode'],
        multiplier: json['multiplier'],
        payout: json['payout']?.toDouble(),
        spot: json['spot'],
        spotTime: getDateTime(json['spot_time']),
      );

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Gets the price proposal for contract
  /// For parameters information refer to [ProposalRequest]
  static Future<PriceProposal> getPriceForContract({
    double amount = 100,
    String barrier,
    String basis = 'payout',
    String contractType = 'CALL',
    String currency = 'USD',
    String symbol,
    DateTime dateExpiry,
    String durationUnit = 's',
    int duration = 60,
  }) async {
    final ProposalResponse proposalResponse = await _api.call(
      request: ProposalRequest(
        amount: amount,
        barrier: barrier,
        basis: basis,
        currency: currency,
        contractType: contractType,
        symbol: symbol,
        dateExpiry: dateExpiry == null
            ? null
            : dateExpiry.millisecondsSinceEpoch ~/ 1000,
        durationUnit: durationUnit,
        duration: duration,
      ),
    );

    if (proposalResponse.error != null) {
      throw ContractOperationException(
          message: proposalResponse.error['message']);
    }

    return PriceProposal.fromJson(proposalResponse.proposal);
  }

  /// Buy this proposal contract
  Future<BuyContractModel> buy({double price}) async {
    final BuyResponse buyResponse = await _api.call(
      request: BuyRequest(
        buy: id,
        price: price,
      ),
    );

    if (buyResponse.error != null) {
      throw ContractOperationException(message: buyResponse.error['message']);
    }

    return BuyContract.fromJson(buyResponse.buy);
  }

  /// Generate a copy of instance with given parameters
  PriceProposal copyWith({
    double askPrice,
    CancellationInfoModel cancellation,
    double commission,
    int dateStart,
    String displayValue,
    String id,
    LimitOrderModel limitOrder,
    String longCode,
    int multiplier,
    double payout,
    double spot,
    DateTime spotTime,
  }) =>
      PriceProposal(
        askPrice: askPrice ?? this.askPrice,
        cancellation: cancellation ?? this.cancellation,
        commission: commission ?? this.commission,
        dateStart: dateStart ?? this.dateStart,
        displayValue: displayValue ?? this.displayValue,
        id: id ?? this.id,
        limitOrder: limitOrder ?? this.limitOrder,
        longCode: longCode ?? this.longCode,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        spot: spot ?? this.spot,
        spotTime: spotTime ?? this.spotTime,
      );
}
