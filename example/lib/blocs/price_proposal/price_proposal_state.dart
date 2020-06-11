part of 'price_proposal_bloc.dart';

abstract class PriceProposalState {
  PriceProposalState();
}

class PriceProposalLoading extends PriceProposalState {
  @override
  String toString() => 'PriceProposalLoading...';
}

class PriceProposalError extends PriceProposalState {
  PriceProposalError(this.message);

  final String message;

  @override
  String toString() => 'PriceProposalError $message';
}

class PriceProposalLoaded extends PriceProposalState {
  PriceProposalLoaded(this.proposal);

  final PriceProposal proposal;

  @override
  String toString() => 'PriceProposal $proposal loaded';
}
