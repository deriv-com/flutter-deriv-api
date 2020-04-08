import 'package:flutter_deriv_api/models/price_proposal_model.dart';
import 'cancellation.dart';
import 'limit_order/limit_order.dart';

/// Implementation of [PriceProposalModel]
class PriceProposal extends PriceProposalModel {
  /// Initializes
  PriceProposal({
    double askPrice,
    Cancellation cancellation,
    double commission,
    int dateStart,
    String displayValue,
    String id,
    LimitOrder limitOrder,
    String longcode,
    int multiplier,
    double payout,
    double spot,
    int spotTime,
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
            ? Cancellation.fromJson(json['cancellation'])
            : null,
        commission: json['commission'],
        dateStart: json['date_start'],
        displayValue: json['display_value'],
        id: json['id'],
        limitOrder: json['limit_order'] != null
            ? LimitOrder.fromJson(json['limit_order'])
            : null,
        longcode: json['longcode'],
        multiplier: json['multiplier'],
        payout: json['payout'],
        spot: json['spot'],
        spotTime: json['spot_time'],
      );

  // TODO(ramin): Will call to the real API whenever its ready
  /// Gets the price proposal for contract
  Future<PriceProposal> getPriceForContract({
    double amount,
    String basis,
    String contractType,
    String currency,
    String symbol,
    int dateExpiry,
    String durationUnit,
  }) async =>
      PriceProposal();

  /// Clone a new instance
  PriceProposal copyWith({
    double askPrice,
    Cancellation cancellation,
    double commission,
    int dateStart,
    String displayValue,
    String id,
    LimitOrder limitOrder,
    String longcode,
    int multiplier,
    double payout,
    double spot,
    int spotTime,
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