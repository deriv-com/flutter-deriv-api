part of 'price_proposal_bloc.dart';

abstract class PriceProposalEvent {}

class SubscribeProposal extends PriceProposalEvent {
  SubscribeProposal(this.contract);

  ContractModel contract;

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