/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_array_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// ProposalArrayRequest class
class ProposalArrayRequest extends Request {
  /// Initialize ProposalArrayRequest
  const ProposalArrayRequest({
    @required this.amount,
    @required this.barriers,
    @required this.basis,
    @required this.contractType,
    @required this.currency,
    @required this.dateExpiry,
    this.dateStart,
    @required this.duration,
    this.durationUnit,
    @required this.multiplier,
    this.productType,
    this.proposalArray = 1,
    this.subscribe,
    @required this.symbol,
    @required this.tradingPeriodStart,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'proposal_array',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ProposalArrayRequest.fromJson(Map<String, dynamic> json) =>
      ProposalArrayRequest(
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as, always_specify_types
        barriers: (json['barriers'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        // ignore: avoid_as
        basis: json['basis'] as String,
        // ignore: avoid_as, always_specify_types
        contractType: (json['contract_type'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as dynamic)
            ?.toList(),
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
        multiplier: json['multiplier'] as num,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        productType: json['product_type'] as String,
        // ignore: avoid_as
        proposalArray: json['proposal_array'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
        // ignore: avoid_as
        symbol: json['symbol'] as String,
        // ignore: avoid_as
        tradingPeriodStart: json['trading_period_start'] as int,
      );

  /// Proposed contract `payout` or `stake` value.
  final num amount;

  /// Array of barrier(s) for the contract.
  final List<Map<String, dynamic>> barriers;

  /// Indicate type of the `amount`.
  final String basis;

  /// One or two valid contract-types.
  final List<dynamic> contractType;

  /// This can only be the account-holder's currency.
  final String currency;

  /// Epoch value of the expiry time of the contract. You must either specify `date_expiry` or duration.
  final int dateExpiry;

  /// [Optional] Indicates epoch value of the starting time of the contract. If left empty, the start time of the contract is now.
  final int dateStart;

  /// Duration quantity.
  final int duration;

  /// [Optional] Duration unit - `s`: seconds, `m`: minutes, `h`: hours, `d`: days, `t`: ticks.
  final String durationUnit;

  /// The multiplier for non-binary options. E.g. lookbacks.
  final num multiplier;

  /// [Optional] If you specify this field, only contracts tradable through that contract type will be returned.
  final String productType;

  /// Must be `1`
  final int proposalArray;

  /// [Optional] 1 - to initiate a realtime stream of prices. Note that tick trades (without a user-defined barrier), digit trades and less than 24 hours at-the-money contracts for the following underlying symbols are not streamed: `R_10`, `R_25`, `R_50`, `R_75`, `R_100`, `RDBULL`, `RDBEAR` (this is because their price is constant).
  final int subscribe;

  /// Symbol code.
  final String symbol;

  /// Required only for multi-barrier trading. Defines the epoch value of the trading period start time.
  final int tradingPeriodStart;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'barriers': barriers,
        'basis': basis,
        'contract_type': contractType,
        'currency': currency,
        'date_expiry': dateExpiry,
        'date_start': dateStart,
        'duration': duration,
        'duration_unit': durationUnit,
        'multiplier': multiplier,
        'passthrough': passthrough,
        'product_type': productType,
        'proposal_array': proposalArray,
        'req_id': reqId,
        'subscribe': subscribe,
        'symbol': symbol,
        'trading_period_start': tradingPeriodStart,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProposalArrayRequest copyWith({
    num amount,
    List<Map<String, dynamic>> barriers,
    String basis,
    List<dynamic> contractType,
    String currency,
    int dateExpiry,
    int dateStart,
    int duration,
    String durationUnit,
    num multiplier,
    String productType,
    int proposalArray,
    int subscribe,
    String symbol,
    int tradingPeriodStart,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ProposalArrayRequest(
        amount: amount ?? this.amount,
        barriers: barriers ?? this.barriers,
        basis: basis ?? this.basis,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        dateStart: dateStart ?? this.dateStart,
        duration: duration ?? this.duration,
        durationUnit: durationUnit ?? this.durationUnit,
        multiplier: multiplier ?? this.multiplier,
        productType: productType ?? this.productType,
        proposalArray: proposalArray ?? this.proposalArray,
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
