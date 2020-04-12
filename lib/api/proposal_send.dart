/// generated automatically from flutter_deriv_api|lib/api/proposal_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'proposal_send.g.dart';

/// JSON conversion for 'proposal_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalRequest extends Request {
  /// Initialize ProposalRequest
  ProposalRequest({
    this.amount,
    this.barrier,
    this.barrier2,
    this.basis,
    this.cancellation,
    this.contractType,
    this.currency,
    this.dateExpiry,
    this.dateStart,
    this.duration,
    this.durationUnit,
    this.limitOrder,
    this.multiplier,
    this.productType,
    this.proposal = 1,
    this.selectedTick,
    this.subscribe,
    this.symbol,
    this.tradingPeriodStart,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ProposalRequest.fromJson(Map<String, dynamic> json) =>
      _$ProposalRequestFromJson(json);

  // Properties
  /// [Optional] Proposed contract payout or stake, or multiplier (for lookbacks).
  final num amount;

  /// [Optional] Barrier for the contract (or last digit prediction for digit contracts). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers. Not needed for lookbacks.
  final String barrier;

  /// [Optional] Low barrier for the contract (for contracts with two barriers). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers. Not needed for lookbacks.
  final String barrier2;

  /// [Optional] Indicates type of the `amount`.
  final String basis;

  /// Cancellation duration option (only for `MULTUP` and `MULTDOWN` contracts).
  final String cancellation;

  /// The proposed contract type
  final String contractType;

  /// This can only be the account-holder's currency (obtained from `payout_currencies` call).
  final String currency;

  /// [Optional] Epoch value of the expiry time of the contract. Either date_expiry or duration is required.
  final int dateExpiry;

  /// [Optional] Indicates epoch value of the starting time of the contract. If left empty, the start time of the contract is now.
  final int dateStart;

  /// [Optional] Duration quantity. Either date_expiry or duration is required.
  final int duration;

  /// [Optional] Duration unit - `s`: seconds, `m`: minutes, `h`: hours, `d`: days, `t`: ticks.
  final String durationUnit;

  /// Add an order to close the contract once the order condition is met (only for `MULTUP` and `MULTDOWN` contracts). Supported orders: `take_profit`, `stop_loss`.
  final Map<String, dynamic> limitOrder;

  /// [Optional] The multiplier for non-binary options. E.g. lookbacks.
  final num multiplier;

  /// [Optional] The product type.
  final String productType;

  /// Must be `1`
  final int proposal;

  /// [Optional] The tick that is predicted to have the highest/lowest value - for `TICKHIGH` and `TICKLOW` contracts.
  final int selectedTick;

  /// [Optional] 1 - to initiate a realtime stream of prices. Note that tick trades (without a user-defined barrier), digit trades and less than 24 hours at-the-money contracts for the following underlying symbols are not streamed: `R_10`, `R_25`, `R_50`, `R_75`, `R_100`, `RDBULL`, `RDBEAR` (this is because their price is constant).
  final int subscribe;

  /// The short symbol name (obtained from `active_symbols` call).
  final String symbol;

  /// [Optional] Required only for multi-barrier trading. Defines the epoch value of the trading period start time.
  final int tradingPeriodStart;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ProposalRequest copyWith({
    num amount,
    String barrier,
    String barrier2,
    String basis,
    String cancellation,
    String contractType,
    String currency,
    int dateExpiry,
    int dateStart,
    int duration,
    String durationUnit,
    Map<String, dynamic> limitOrder,
    num multiplier,
    String productType,
    int proposal,
    int selectedTick,
    int subscribe,
    String symbol,
    int tradingPeriodStart,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ProposalRequest(
        amount: amount ?? this.amount,
        barrier: barrier ?? this.barrier,
        barrier2: barrier2 ?? this.barrier2,
        basis: basis ?? this.basis,
        cancellation: cancellation ?? this.cancellation,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        dateStart: dateStart ?? this.dateStart,
        duration: duration ?? this.duration,
        durationUnit: durationUnit ?? this.durationUnit,
        limitOrder: limitOrder ?? this.limitOrder,
        multiplier: multiplier ?? this.multiplier,
        productType: productType ?? this.productType,
        proposal: proposal ?? this.proposal,
        selectedTick: selectedTick ?? this.selectedTick,
        subscribe: subscribe ?? this.subscribe,
        symbol: symbol ?? this.symbol,
        tradingPeriodStart: tradingPeriodStart ?? this.tradingPeriodStart,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
