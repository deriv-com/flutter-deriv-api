import 'package:flutter_deriv_api/api/contract/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/api/contract/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Latest price and other details for a given contract
abstract class PriceProposalModel extends APIBaseModel {
  /// Initializes
  PriceProposalModel({
    this.askPrice,
    this.cancellation,
    this.commission,
    this.dateExpiry,
    this.dateStart,
    this.displayValue,
    this.id,
    this.limitOrder,
    this.longCode,
    this.multiplier,
    this.payout,
    this.spot,
    this.spotTime,
  });

  /// The ask price.
  final double? askPrice;

  /// Contains information about contract cancellation option.
  final CancellationInfoModel? cancellation;

  /// Commission changed in percentage (%).
  final double? commission;

  /// Expiry time in epoch for contract cancellation option.
  final DateTime dateExpiry;

  /// The start date of the contract.
  final DateTime? dateStart;

  /// Same as `ask_price`.
  final String? displayValue;

  /// A stream ID that can be used to cancel this stream using the Forget request.
  final String? id;

  /// Contains limit order information.
  /// (Only applicable for contract with limit order).
  final LimitOrderModel? limitOrder;

  /// Example: Win payout if Random 100 Index is strictly higher than
  /// entry spot at 15 minutes after contract start time.
  final String? longCode;

  /// [Only for look back trades] Multiplier applies
  /// when calculating the final payoff for each type of lookback.
  /// e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final int? multiplier;

  /// he payout amount of the contract.
  final double? payout;

  /// Spot value (if there are no Exchange data-feed licensing restrictions
  /// for the underlying symbol).
  final double? spot;

  /// The corresponding time of the spot value.
  final DateTime? spotTime;
}
