/// generated automatically from flutter_deriv_api|lib/api/proposal_array_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'proposal_array_send.g.dart';

/// JSON conversion for 'proposal_array_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalArrayRequest extends Request {
  /// Initialize ProposalArrayRequest
  ProposalArrayRequest({
    this.amount,
    this.barriers,
    this.basis,
    this.contractType,
    this.currency,
    this.dateExpiry,
    this.dateStart,
    this.duration,
    this.durationUnit,
    this.multiplier,
    this.productType,
    this.proposalArray = 1,
    this.subscribe,
    this.symbol,
    this.tradingPeriodStart,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ProposalArrayRequest.fromJson(Map<String, dynamic> json) =>
      _$ProposalArrayRequestFromJson(json);

  // Properties
  /// Proposed contract `payout` or `stake` value.
  final num amount;

  /// Array of barrier(s) for the contract.
  final List<Map<String, dynamic>> barriers;

  /// Indicate type of the `amount`.
  final String basis;

  /// One or two valid contract-types.
  final List<String> contractType;

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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalArrayRequestToJson(this);
}
