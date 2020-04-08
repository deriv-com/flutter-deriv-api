import 'package:flutter_deriv_api/logic/contracts/price_proposal/limit_order/limit_order.dart';
import 'package:flutter_deriv_api/logic/contracts/price_proposal/cancellation.dart';

/// Latest price and other details for a given contract
abstract class PriceProposalModel {
  /// Initializes
  PriceProposalModel(
    this.askPrice,
    this.cancellation,
    this.commission,
    this.dateStart,
    this.displayValue,
    this.id,
    this.limitOrder,
    this.longcode,
    this.multiplier,
    this.payout,
    this.spot,
    this.spotTime,
  );

  /// The ask price.
  final double askPrice;

  /// Contains information about contract cancellation option.
  final Cancellation cancellation;

  /// Commission changed in percentage (%).
  final double commission;

  /// The start date of the contract.
  final int dateStart;

  /// Same as `ask_price`.
  final String displayValue;

  /// A stream ID that can be used to cancel this stream using the Forget request.
  final String id;

  /// Contains limit order information.
  /// (Only applicable for contract with limit order).
  final LimitOrder limitOrder;

  /// Example: Win payout if Random 100 Index is strictly higher than
  /// entry spot at 15 minutes after contract start time.
  final String longcode;

  /// [Only for lookback trades] Multiplier applies
  /// when calculating the final payoff for each type of lookback.
  /// e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final int multiplier;

  /// he payout amount of the contract.
  final double payout;

  /// Spot value (if there are no Exchange data-feed licensing restrictions
  /// for the underlying symbol).
  final double spot;

  /// The corresponding time of the spot value.
  final int spotTime;
}