/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// ProposalRequest class
class ProposalRequest extends Request {
  /// Initialize ProposalRequest
  const ProposalRequest({
    this.amount,
    this.barrier,
    this.barrier2,
    this.basis,
    @required this.cancellation,
    @required this.contractType,
    @required this.currency,
    this.dateExpiry,
    this.dateStart,
    this.duration,
    this.durationUnit,
    @required this.limitOrder,
    this.multiplier,
    this.productType,
    this.proposal = 1,
    this.selectedTick,
    this.subscribe,
    @required this.symbol,
    this.tradingPeriodStart,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'proposal',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ProposalRequest.fromJson(Map<String, dynamic> json) =>
      ProposalRequest(
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as
        barrier: json['barrier'] as String,
        // ignore: avoid_as
        barrier2: json['barrier2'] as String,
        // ignore: avoid_as
        basis: json['basis'] as String,
        // ignore: avoid_as
        cancellation: json['cancellation'] as String,
        // ignore: avoid_as
        contractType: json['contract_type'] as String,
        // ignore: avoid_as
        currency: json['currency'] as String,
        // ignore: avoid_as
        dateExpiry: json['date_expiry'] as int,
        // ignore: avoid_as
        dateStart: json['date_start'] as int,
        // ignore: avoid_as
        duration: json['duration'] as int,
        // ignore: avoid_as
        durationUnit: json['duration_unit'] as String,
        // ignore: avoid_as
        limitOrder: json['limit_order'] as Map<String, dynamic>,
        // ignore: avoid_as
        multiplier: json['multiplier'] as num,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        productType: json['product_type'] as String,
        // ignore: avoid_as
        proposal: json['proposal'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        selectedTick: json['selected_tick'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
        // ignore: avoid_as
        symbol: json['symbol'] as String,
        // ignore: avoid_as
        tradingPeriodStart: json['trading_period_start'] as int,
      );

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

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'barrier': barrier,
        'barrier2': barrier2,
        'basis': basis,
        'cancellation': cancellation,
        'contract_type': contractType,
        'currency': currency,
        'date_expiry': dateExpiry,
        'date_start': dateStart,
        'duration': duration,
        'duration_unit': durationUnit,
        'limit_order': limitOrder,
        'multiplier': multiplier,
        'passthrough': passthrough,
        'product_type': productType,
        'proposal': proposal,
        'req_id': reqId,
        'selected_tick': selectedTick,
        'subscribe': subscribe,
        'symbol': symbol,
        'trading_period_start': tradingPeriodStart,
      };

  /// Creates a copy of instance with given parameters
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
    Map<String, dynamic> passthrough,
    int reqId,
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
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
