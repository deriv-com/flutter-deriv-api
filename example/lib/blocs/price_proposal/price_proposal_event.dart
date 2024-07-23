part of 'price_proposal_bloc.dart';

/// PriceProposalEvent
abstract class PriceProposalEvent {}

/// SubscribeProposal
class SubscribeProposal extends PriceProposalEvent {
  ///Initializes
  SubscribeProposal(
    this.contract, {
    this.basis = 'payout',
    this.durationUnit = 's',
    this.duration = 60,
    this.amount = 100,
  });

  /// Contract
  AvailableItem? contract;

  /// Basis
  final String basis;

  /// DurationUnit
  final String durationUnit;

  /// Duration
  final int duration;

  /// Amount
  final double amount;

  @override
  String toString() => 'SubscribeProposal';
}

/// YieldProposalLoaded
class YieldProposalLoaded extends PriceProposalEvent {
  /// Initializes
  YieldProposalLoaded(this.proposal);

  /// Loaded proposal
  final ProposalResponse proposal;

  @override
  String toString() => 'Yield $proposal loaded';
}

/// YieldError
class YieldError extends PriceProposalEvent {
  /// Initializes
  YieldError(this.message);

  /// Error message
  final String? message;

  @override
  String toString() => 'Proposal $message';
}
