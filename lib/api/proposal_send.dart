/// Autogenerated from flutter_deriv_api|lib/api/proposal_send.json
import 'dart:async';
import 'dart:convert';
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'proposal',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ProposalRequest.fromJson(Map<String, dynamic> json) =>
      _$ProposalRequestFromJson(json);

  // Properties
  /// [Optional] Proposed contract payout or stake, or multiplier (for lookbacks).
  num amount;

  /// [Optional] Barrier for the contract (or last digit prediction for digit contracts). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers. Not needed for lookbacks.
  String barrier;

  /// [Optional] Low barrier for the contract (for contracts with two barriers). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers. Not needed for lookbacks.
  String barrier2;

  /// [Optional] Indicates type of the `amount`.
  String basis;

  /// The proposed contract type
  String contractType;

  /// This can only be the account-holder's currency (obtained from payout_currencies call).
  String currency;

  /// [Optional] Epoch value of the expiry time of the contract. Either date_expiry or duration is required.
  int dateExpiry;

  /// [Optional] Indicates epoch value of the starting time of the contract. If left empty, the start time of the contract is now.
  int dateStart;

  /// [Optional] Duration quantity. Either date_expiry or duration is required.
  int duration;

  /// [Optional] Duration unit - s(seconds), m(minutes), h(hours), d(days), t(ticks).
  String durationUnit;

  /// Add an order to close the contract once the order condition is met (only for `MULTUP` and `MULTDOWN`). Supported order (`take_profit`, `stop_loss`)
  Map<String, dynamic> limitOrder;

  /// [Optional] The multiplier for non-binary options. E.g. lookbacks.
  num multiplier;

  /// [Optional] The product type.
  String productType;

  /// Must be `1`
  int proposal;

  /// [Optional] The tick that is predicted to have the highest/lowest value - for `TICKHIGH` and `TICKLOW` contracts.
  int selectedTick;

  /// [Optional] 1 - to initiate a realtime stream of prices. Note that tick trades (without a user-defined barrier), digit trades and less than 24 hours at-the-money contracts for the following underlying symbols are not streamed: `R_10`, `R_25`, `R_50`, `R_75`, `R_100`, `RDBULL`, `RDBEAR` (this is because their price is constant).
  int subscribe;

  /// The short symbol name (obtained from `active_symbols` call).
  String symbol;

  /// [Optional] Required only for multi-barrier trading. Defines the epoch value of the trading period start time.
  int tradingPeriodStart;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalRequestToJson(this);
}
