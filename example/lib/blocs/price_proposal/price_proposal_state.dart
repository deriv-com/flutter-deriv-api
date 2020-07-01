part of 'price_proposal_bloc.dart';

/// PriceProposalState
abstract class PriceProposalState {
  ///Initializes
  PriceProposalState();
}

/// PriceProposalLoading
class PriceProposalLoading extends PriceProposalState {
  @override
  String toString() => 'PriceProposalLoading...';
}

/// PriceProposalError
class PriceProposalError extends PriceProposalState {
  /// Initializes
  PriceProposalError(this.message);

  /// Error message
  final String message;

  @override
  String toString() => 'PriceProposalError $message';
}

/// PriceProposalLoaded
class PriceProposalLoaded extends PriceProposalState {
  /// Initializes
  PriceProposalLoaded(this.proposal);

  /// Loaded proposal
  final PriceProposal proposal;

  @override
  String toString() => 'PriceProposal $proposal loaded';
}
