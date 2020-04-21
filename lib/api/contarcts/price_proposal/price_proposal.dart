import 'package:flutter_deriv_api/api/models/buy_contract_model.dart';
import 'package:flutter_deriv_api/helpers.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/api/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/models/price_proposal_model.dart';
import 'package:flutter_deriv_api/api/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/api/contarcts/price_proposal/exceptions/price_proposal_exception.dart';

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
    String longcode,
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
          longcode,
          multiplier,
          payout,
          spot,
          spotTime,
        );

  /// From Json
  factory PriceProposal.fromJson(Map<String, dynamic> json) => PriceProposal(
        askPrice:
            json['ask_price'] != null ? json['ask_price'].toDouble() : null,
        cancellation: json['cancellation'] != null
            ? CancellationInfoModel.fromJson(json['cancellation'])
            : null,
        commission: json['commission'],
        dateStart:
            json['date_start'] != null ? getDateTime(json['date_start']) : null,
        displayValue: json['display_value'],
        id: json['id'],
        limitOrder: json['limit_order'] != null
            ? LimitOrderModel.fromJson(json['limit_order'])
            : null,
        longcode: json['longcode'],
        multiplier: json['multiplier'],
        payout: json['payout'],
        spot: json['spot'],
        spotTime:
            json['spot_time'] != null ? getDateTime(json['spot_time']) : null,
      );

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Gets the price proposal for contract
  /// For parameters information refer to [ProposalRequest]
  static Future<PriceProposal> getPriceForContract({
    double amount,
    double barrier,
    String basis,
    String contractType,
    String currency,
    String symbol,
    DateTime dateExpiry,
    String durationUnit,
  }) async {
    final ProposalResponse proposalResponse = await _api.call(
      request: ProposalRequest(
        amount: amount,
        barrier: barrier.toString(),
        basis: basis,
        contractType: contractType,
        symbol: symbol,
        dateExpiry: dateExpiry.millisecondsSinceEpoch ~/ 1000,
        durationUnit: durationUnit,
      ),
    );

    if (proposalResponse.error != null) {
      throw PriceProposalException(message: proposalResponse.error['message']);
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
      throw PriceProposalException(message: buyResponse.error['message']);
    }

    return BuyContractModel.fromJson(buyResponse.buy);
  }

  /// Clone a new instance
  PriceProposal copyWith({
    double askPrice,
    CancellationInfoModel cancellation,
    double commission,
    int dateStart,
    String displayValue,
    String id,
    LimitOrderModel limitOrder,
    String longcode,
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
        longcode: longcode ?? this.longcode,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        spot: spot ?? this.spot,
        spotTime: spotTime ?? this.spotTime,
      );
}
