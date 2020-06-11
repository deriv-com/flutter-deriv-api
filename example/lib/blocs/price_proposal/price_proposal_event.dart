part of 'price_proposal_bloc.dart';

abstract class PriceProposalEvent {}

class SubscribeProposal extends PriceProposalEvent {
  SubscribeProposal(
    this.contract, {
    this.basis = 'payout',
    this.durationUnit = 's',
    this.duration = 60,
  });

  ContractModel contract;

  final String basis;
  final String durationUnit;
  final int duration;

  @override
  String toString() => 'SubscribeProposal';
}

class YieldProposalLoaded extends PriceProposalEvent {
  YieldProposalLoaded(this.proposal);

  final PriceProposal proposal;

  @override
  String toString() => 'Yield $proposal loaded';
}

class YieldError extends PriceProposalEvent {
  YieldError(this.message);

  final String message;

  @override
  String toString() => 'Proposal $message';
}
